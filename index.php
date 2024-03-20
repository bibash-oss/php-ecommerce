<?php
include('functions/userfunctions.php');
include('includes/header.php');
include('includes/slider.php');
?>


<div class="py-5">
    <div class="container">
        <div class="row">
            <div class="col md-12">
                <h4>Trending Products</h4>
                <div class="underline mb-2"></div>
                <div class="owl-carousel">
                    <?php
                    $trendingProducts = getAllTrending();
                    if (mysqli_num_rows($trendingProducts) > 0) {
                        foreach ($trendingProducts as $item) {
                    ?>
                            <div class="item">
                                <a href="product-view.php?product=<?= $item['slug']; ?>">
                                    <div class="card shadow">
                                        <div class="card-body ">
                                            <img src="uploads/<?= $item['image']; ?>" alt="Product name" class=" w-100" height="250px">
                                            <h6 class="text-center"><?= $item['name']; ?></h6>
                                        </div>
                                    </div>
                                </a>
                            </div>
                    <?php
                        }
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="py-5 bg-f2f2f2">
    <div class="container">
        <div class="row">
            <div class="col md-12">
                <h4>About Us</h4>
                <div class="underline mb-2"></div>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium fugiat doloribus quis nesciunt beatae voluptatum, officia cupiditate illo, tenetur sit magni sequi obcaecati est praesentium cumque dignissimos! Error, aliquam in.</p>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium fugiat doloribus quis nesciunt beatae voluptatum, officia cupiditate illo, tenetur sit magni sequi obcaecati est praesentium cumque dignissimos! Error, aliquam in.
                    <br>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium fugiat doloribus quis nesciunt beatae voluptatum, officia cupiditate illo, tenetur sit magni sequi obcaecati est praesentium cumque dignissimos! Error, aliquam in.
                </p>
            </div>
        </div>
    </div>
</div>

<div class="py-5 bg-dark">
    <div class="container">
        <div class="row">
            <div class="col md-3">
                <h4 class="text-white">E-shop</h4>
                <div class="underline mb-2"></div>
                <a href="index.php" class="text-white"><i class="fa fa-angle-right">Home</i></a> <br>
                <a href="#" class="text-white"><i class="fa fa-angle-right">About Us</i></a><br>
                <a href="cart.php" class="text-white"><i class="fa fa-angle-right">My Cart</i></a><br>
                <a href="categories.php" class="text-white"><i class="fa fa-angle-right">Our Collections</i></a>
            </div>
            <div class="col-md-3 text-white">
                <h4>Address</h4>
                <p>
                    Nepal, Kathmandu
                </p>
                <a class="text-white" href="tel:+977 9823433222"><i class="fa fa-phone">+977 9823456789</i></a><br>
                <a class="text-white" href="emailto:xyz@gmail.com"><i class="fa fa-envelope">xyz@gmail.com</i></a>
            </div>
        </div>
    </div>
</div>
<div class="py-2 bg-danger">
    <div class="text-center">
        <p class="mb-0 text-white">All rights reserved. Copyright@ - <?= date('Y') ?> </p>
    </div>
</div>


<?php include('includes/footer.php') ?>

<script>
    $(document).ready(function() {
        $('.owl-carousel').owlCarousel({
            loop: true,
            margin: 10,
            nav: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 3
                },
                1000: {
                    items: 4
                }
            }
        })
    });
</script>