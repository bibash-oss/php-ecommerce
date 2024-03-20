<?php
include('functions/userfunctions.php');
include('includes/header.php');
include('authenticate.php');
$cartItems = getCartItems();
if (mysqli_num_rows($cartItems) == 0) {
    header('Location: index.php');
}


?>

<div class="py-3 bg-primary">
    <div class="container">
        <h6 class="text-white">
            <a href="./index.php" class="text-white">
                Home /
            </a>
            <a href="./checkout.php" class="text-white">
                Checkout
            </a>
        </h6>
    </div>
</div>

<div class="py-5">
    <div class="container">
        <div class="card">
            <div class="card-body shadow">
                <form id="checkoutForm" action="functions/placeorder.php" method="POST">
                    <div class="row">
                        <div class="col-md-7">
                            <h5>Basic Details</h5>
                            <hr>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="fw-bold ">Name</label>
                                    <input type="text" required name="name" id="name" placeholder="Enter your full name" class="form-control">
                                    <small class="text-danger name"></small>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="fw-bold ">E-mail</label>
                                    <input type="email" required name="email" id="email" placeholder="Enter your email" class="form-control">
                                    <small class="text-danger email"></small>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="fw-bold ">Phone</label>
                                    <input type="text" required name="phone" id="phone" placeholder="Enter your phone number" class="form-control">
                                    <small class="text-danger phone"></small>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="fw-bold ">Pin Code</label>
                                    <input type="text" required name="pincode" id="pincode" placeholder="Enter your pin code" class="form-control">
                                    <small class="text-danger pincode"></small>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label class="fw-bold ">Address</label>
                                    <textarea name="address" id="address" required class="form-control" rows="5"></textarea>
                                    <small class="text-danger address"></small>
                                </div>
                            </div>
                        </div>
                        <div class="col md-5">
                            <h5>Order Details</h5>
                            <hr>
                            <?php $items = getCartItems();
                            $totalPrice = 0;
                            foreach ($items as $citem) {
                            ?>
                                <div class="mb-1 border">
                                    <div class="row align-items-center">
                                        <div class="col-md-2">
                                            <img src="uploads/<?= $citem['image'] ?>" alt="Image" width="60px">
                                        </div>
                                        <div class="col-md-5">
                                            <label><?= $citem['name'] ?></label>
                                        </div>
                                        <div class="col-md-3">
                                            <label><?= $citem['selling_price'] ?></label>
                                        </div>
                                        <div class="col-md-2">
                                            <label>x<?= $citem['prod_qty'] ?></] el>
                                        </div>
                                    </div>
                                </div>
                            <?php
                                $totalPrice += $citem['selling_price'] * $citem['prod_qty'];
                            }
                            ?>
                            <hr>
                            <h5>Total Price : <span class="float-end fw-bold"><?= $totalPrice ?></span></h5>
                            <div class="">
                                <input type="hidden" name="payment_mode" value="COD">
                                <button type="submit" name="placeOrderBtn" class="btn btn-primary w-100">Confirm and place order | COD</button>
                                <button type="button" id="payment-button" name="payment-button" class="btn btn-primary w-100 mt-2">Pay with Khalti</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<?php include('includes/footer.php') ?>

<script src="https://khalti.s3.ap-south-1.amazonaws.com/KPG/dist/2020.12.17.0.0.0/khalti-checkout.iffe.js"></script>

<script>
    var config = {
        // replace the publicKey with yours
        "publicKey": "test_public_key_eec404c6e23b49408e11ae1d5e081002",
        "productIdentity": "1234567890",
        "productName": "Dragon",
        "productUrl": "http://gameofthrones.wikia.com/wiki/Dragons",
        "paymentPreference": [
            "KHALTI",
            "EBANKING",
            "MOBILE_BANKING",
            "CONNECT_IPS",
            "SCT",
        ],
        "eventHandler": {
            onSuccess(payload) {
                // hit merchant api for initiating verfication
                console.log(payload.token);
                var name = $('#name').val();
                var email = $('#email').val();
                var phone = $('#phone').val();
                var pincode = $('#pincode').val();
                var address = $('#address').val();
                var data = {
                    "name": name,
                    "email": email,
                    "phone": phone,
                    "pincode": pincode,
                    "address": address,
                    "payment_mode": "Paid by Khalti",
                    "payment_id": payload.idx,
                    "token": payload.token,
                    "placeOrderBtn": true
                };
                console.log(data.token);
                $.ajax({
                    method: "POST",
                    url: "functions/placeorder.php",
                    data: data,
                    success: function(response) {
                        console.log(response);
                        if (response.trim() === "201") {
                            alertify.success("Order Placed Successfully | Paid by Khalti");
                        } else {
                            alertify.error("Failed to place order");
                        }
                    }
                });
            },
            onError(error) {
                console.log(error);
            },
            onClose() {
                console.log('widget is closing');
            }
        }
    };



    var checkout = new KhaltiCheckout(config);
    var btn = document.getElementById("payment-button");
    btn.onclick = function() {
        var name = $('#name').val();
        var email = $('#email').val();
        var phone = $('#phone').val();
        var pincode = $('#pincode').val();
        var address = $('#address').val();
        if (name.length === 0) {
            $('.name').text("*This field is required");

        } else {
            $('.name').text("");

        }
        if (email.length === 0) {
            $('.email').text("*This field is required");

        } else {
            $('.email').text("");

        }
        if (phone.length === 0) {
            $('.phone').text("*This field is required");

        } else {
            $('.phone').text("");

        }
        if (pincode.length === 0) {
            $('.pincode').text("*This field is required");

        } else {
            $('.pincode').text("");

        }
        if (address.length === 0) {
            $('.address').text("*This field is required");

        } else {
            $('.address').text("");

        }

        if (name.length == 0 || email.length == 0 || phone.length == 0 || pincode == 0 || address.length == 0) {
            return false;
        }

        // minimum transaction amount must be 10, i.e 1000 in paisa.

        checkout.show({
            amount: 1000
        });
    }
</script>