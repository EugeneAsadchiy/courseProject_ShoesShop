<!DOCTYPE HTML>
<html lang="ru">

<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="/css/${"home.css"}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <#--    <link rel="stylesheet" href="/css/${"home.css"}">-->
</head>

<body>
<div>
    <header>
        <div class="px-3 py-2 text-bg-dark">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <#--                    <a href="/" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">-->
                    <#--                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>-->
                    <#--                    </a>-->

                    <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
                        <li>
                            <a href="/home" class="nav-link text-white">
                                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#home"></use></svg>
                                Главная
                            </a>
                        </li>
                        <li>
                            <#if session==1>
                                <a href="/add_products" class="nav-link text-white">
                                    <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#speedometer2"></use></svg>
                                    Добавить обувь
                                </a>
                            </#if>
                        </li>
                        <li>
                            <#if session==1>
                                <a href="/confirmed_orders" class="nav-link text-white">
                                    <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#table"></use></svg>
                                    Заказы
                                </a>
                            <#else>
                                <a href="/orders" class="nav-link text-white">
                                    <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#table"></use></svg>
                                    Корзина
                                </a>
                            </#if>
                        </li>
                        <li>
                            <#if session==1>
                                <a href="/products" class="nav-link text-white">
                                    <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#grid"></use></svg>
                                    Обувь
                                </a>
                            <#else>
                                <a href="/confirmed_orders" class="nav-link text-secondary">
                                    <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#grid"></use></svg>
                                    Заказы
                                </a>
                            </#if>
                        </li>
                        <li>
                            <#if session==1>
                                <a href="/customers" class="nav-link text-white">
                                    <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#people-circle"></use></svg>
                                    Покупатели
                                </a>
                            <#else>
                                <a href="/" class="nav-link text-white">
                                    <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#grid"></use></svg>
                                    О нас
                                </a>
                            </#if>
                        </li>
                        <li>
                            <a href="/" class="nav-link text-white" style=" margin-left: 600px">
                                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#people-circle"></use></svg>
                                ${profile}
                            </a>
                            <#--                            <#if session==1>-->

                            <#--                            <#else>-->
                            <#--                                <p>В корзину</p>-->
                            <#--                            </#if>-->
                        </li>
                        <li>
                            <button type="button" class="btn btn-danger text-dark me-2" style="margin-top: 30px; margin-left: 30px">
                                <a href="/authorization" style="color: black; text-decoration: none">Выйти</a>
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </header>
</div> <!--header-->

<#if session==1>
<form action="/confirmed_orders" method="get">
    <h3 style="position: absolute">Выручка</h3>
    <div style="display: flex; align-items: center; justify-content: space-between;">
<#--        <p>Рассчет валовой выручки</p>-->
        <input style="margin-left: 10px" type="text" placeholder="От.." name="date_since" class="form-control" >
        <input style="margin-left: 10px" type="text" placeholder="До.." name="date_before" class="form-control" >
        <input class="btn btn-primary" style="margin-left: 10px" type="submit" value="Рассчитать">
        <div style="display: flex">
            <h1 style="margin-right: 10px;margin-left: 10px; margin-top: 25px">Итого</h1>
            <h2 class="box" style="margin-left: 10px; margin-right: 50px">${fullprice} р.</h2>
        </div>


    </div>

<#--    <input class="btn btn-primary" type="submit" value="Фильтровать">-->
</form>
</#if>
<table class="table" style="margin: 0px auto">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Название</th>
        <th scope="col">Цена</th>
        <th scope="col">Пол</th>
        <th scope="col">Размер</th>
        <th scope="col">Сезон</th>
        <th scope="col">Дата</th>
    </tr>
    </thead>
    <tbody>
    <#list confirmedOrders as orders>
        <tr>
            <th scope="row">${orders.id_orders}</th>
            <td>${orders.nameProducts}</td>
            <td>${orders.cost} р.</td>
            <td>${orders.gender}</td>
            <td>${orders.size}</td>
            <td>${orders.season}</td>
            <td>${orders.dataOfCreated.toString()}</td>
        </tr>
    </#list>
    </tbody>
</table>


</body>
</html>