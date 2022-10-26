<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Child</title>
    <?php wp_head() ?>
</head>
<body>
    <header id="navbar">
        <nav>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <?php
                            wp_nav_menu([
                                'theme_location' => 'main-menu'
                            ]);
                        ?>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <main id="child-wrapper">