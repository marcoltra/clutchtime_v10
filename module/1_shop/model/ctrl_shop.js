var todasLasEntradas = [];

function loadEntradas(desde = 0, items = 12) {
    var tipo = localStorage.getItem('filtro_tipo') || 'todos';
    ajaxForSearch('module/1_shop/ctrl/ctrl_shop.php?op=getEntradas', desde, items);
}

function ajaxForSearch(url, total_prod = 0, items_page = 12) {
    if (total_prod != 0) {
        localStorage.setItem('total_prod', total_prod);
    } else {
        if (localStorage.getItem('total_prod')) {
            total_prod = localStorage.getItem('total_prod');
        } else {
            total_prod = 0;
        }
    }
    ajaxPromise(url, 'POST', 'JSON', { 'desde': total_prod, 'items': items_page })
        .then(function(data) {
            $('#shop-tickets-grid').empty();

            if (data == "error") {
                $('<div></div>').appendTo('#shop-tickets-grid')
                    .html('<h3>No hay entradas disponibles</h3>');
            } else {
                for (var row in data) {
                    if (data[row].tipo == 'evento') {
                        $('<div></div>').attr({ 'id': data[row].id, 'class': 'ticket-card','data-tipo': 'evento' })
                        .appendTo('#shop-tickets-grid')
                        .html(
                            '<div class="tc-img-header">' +
                            '<img src="' + data[row].imagen_url + '">' +
                            '<div class="tc-img-overlay">' +  
                            '<b>' + data[row].nombre + '</b>' +
                            '</div>' +
                            '</div>' +   
                            '<div class="tc-title">' + data[row].nombre + '</div>' +
                            '<span>' + data[row].fecha + '</span>'
                        );
                    } else {
                        $('<div></div>').attr({ 'id': data[row].id, 'class': 'ticket-card','data-tipo': 'partido' })
                        .appendTo('#shop-tickets-grid')
                        .html(
                            '<div class="tc-vs-header">' +
                            '<img src="' + data[row].imagen_url + '" style="width:100%;height:100%;object-fit:cover;">' +
                            '<div class="tc-img-overlay">' +
                            '<b>' + data[row].nombre + '</b>' +
                            '</div>' +
                            '</div>' +
                            '<span>' + data[row].fecha + '</span>'
                        );
                    }
                }
            }
        }).catch(function() {
            console.log('error ajaxForSearch');
        });
}
function filter_tipo() {
    $(document).on('click', '.sf-tab', function() {
        $('.sf-tab').removeClass('sf-active');
        $(this).addClass('sf-active');

        var tipo = this.getAttribute('data-tipo');
        localStorage.setItem('filtro_tipo', tipo);

        loadEntradas();
    });
}
function clicks() {
    $(document).on("click", ".ticket-card", function() {
        var id_entrada = this.getAttribute('id');
        var tipo = this.getAttribute('data-tipo');
        loadDetails(id_entrada, tipo);
    });
}

function loadDetails(id_entrada, tipo) {
    ajaxPromise('module/1_shop/ctrl/ctrl_shop.php?op=details_entrada&id=' + id_entrada + '&tipo=' + tipo, 'GET', 'JSON')
    .then(function(data) {

        $('#shop-list-view').hide();
        $('#shop-detail-view').show();
        $('#shop-detail-content').empty();

        if (tipo == 'evento') {
            $('#shop-detail-content').html(
                '<div class="tc-img-header" style="height:250px;margin-bottom:20px;">' +
                '<img src="' + data.imagen_url + '">' +
                '</div>' +
                '<h2 class="tc-title">' + data.nombre + '</h2>' +
                '<div class="tc-meta">' +
                '<span>📅 ' + data.fecha_inicio + '</span>' +
                '<span>📍 ' + data.nombre_ciudad  + '</span>' +
                '<span>🏀 ' + data.tipo + '</span>' +
                '</div>'
            );
        } else {
            $('#shop-detail-content').html(
                '<div class="tc-img-header" style="height:250px;margin-bottom:20px;">' +
                '<img src="' + data.imagen_url + '">' +
                '</div>' +
                '<h2 class="tc-title">' + data.nombre_local + ' vs ' + data.nombre_visitante + '</h2>' +
                '<div class="tc-meta">' +
                '<span>📅 ' + data.fecha + '</span>' +
                '<span>🏀 ' + data.estado + '</span>' +
                '</div>'
            );
        }

        $('html, body').animate({ scrollTop: 0 });

    }).catch(function() {
        console.log('error loadDetails');
    });
}

    function load_filter() {
        $('#shop-sidebar').html(
            '<div class="sf-group">' +
            '<span class="sf-group-label">Tipo de evento</span>' +
            '<div class="sf-check-list">' +
            '<label class="sf-check-label"><input type="checkbox" class="sf-check tipo-evento" value="All-Star Game"><span class="sf-check-box"></span>All-Star Game</label>' +
            '<label class="sf-check-label"><input type="checkbox" class="sf-check tipo-evento" value="Draft"><span class="sf-check-box"></span>Draft</label>' +
            '<label class="sf-check-label"><input type="checkbox" class="sf-check tipo-evento" value="Playoffs"><span class="sf-check-box"></span>Playoffs</label>' +
            '<label class="sf-check-label"><input type="checkbox" class="sf-check tipo-evento" value="Finals"><span class="sf-check-box"></span>Finals</label>' +
            '<label class="sf-check-label"><input type="checkbox" class="sf-check tipo-evento" value="Summer League"><span class="sf-check-box"></span>Summer League</label>' +
            '</div>' +
            '</div>' +
            '<div class="sf-group">' +
            '<span class="sf-group-label">Ciudad</span>' +
            '<div class="sf-field">' +
            '<select id="select_ciudad" class="sf-select">' +
            '<option value="*">Todas</option>' +
            '<option value="New York">New York</option>' +
            '<option value="Miami">Miami</option>' +
            '<option value="Los Angeles">Los Angeles</option>' +
            '<option value="Boston">Boston</option>' +
            '<option value="Golden State">Golden State</option>' +
            '<option value="Dallas">Dallas</option>' +
            '</select>' +
            '</div>' +
            '</div>' +
            '<div class="sf-group">' +
            '<span class="sf-group-label">Temporada</span>' +
            '<div class="sf-field">' +
            '<select id="select_temporada" class="sf-select">' +
            '<option value="*">Todas</option>' +
            '<option value="2023-24">2023-24</option>' +
            '<option value="2024-25">2024-25</option>' +
            '<option value="2025-26">2025-26</option>' +
            '</select>' +
            '</div>' +
            '</div>' +
            '<button class="sf-clear submit_filter" style="width:100%">Filtrar</button>' +
            '<button class="sf-clear remove_filters" style="width:100%;margin-top:6px">Quitar filtros</button>'
            
        );

    $(document).on('click', '.submit_filter', function() {
        save_filters();
    });

    $(document).on('click', '.remove_filters', function() {
        remove_filters();
    });
}

function save_filters() {
    var tipos_evento = [];
    var filters = [];

    localStorage.removeItem('filters');
    localStorage.removeItem('search');
    localStorage.removeItem('order');

    $.each($("input[class*='tipo-evento']:checked"), function() {
        tipos_evento.push($(this).val());
    });
    if (tipos_evento.length != 0) {
        filters.push({ "tipo_evento": tipos_evento });
    } else {
        filters.push({ "tipo_evento": '*' });
    }
    var ciudad = document.getElementById("select_ciudad").value;
    filters.push({ "ciudad": ciudad });
    var temporada = document.getElementById("select_temporada").value;
    filters.push({ "temporada": temporada });
    localStorage.setItem('filters', JSON.stringify(filters));
    shop_filters();
}

function shop_filters() {
    var all_filters = JSON.parse(localStorage.getItem('filters'));
    var tipo_evento = all_filters[0].tipo_evento;
    var ciudad      = all_filters[1].ciudad;
    var temporada   = all_filters[2].temporada;
    ajaxForSearch('module/1_shop/ctrl/ctrl_shop.php?op=filters&tipo_evento=' + tipo_evento + '&ciudad=' + ciudad + '&temporada=' + temporada, 0, 12);
}

function highlightFilters() {
    var all_filters = JSON.parse(localStorage.getItem('filters'));

    if (all_filters[1].Num_doors[0] != '*') {
        document.getElementById(all_filters[1].Num_doors[0]).setAttribute('checked', true);
    }
    if (all_filters[2].category[0] != '*') {
        document.getElementById('select_cat').value = all_filters[2].category[0];
    }
    if (all_filters[0].Color[0] != '*') {
        for (row in all_filters[0].Color) {
            document.getElementById(all_filters[0].Color[row]).setAttribute('checked', true);
        }
    }
}

function highlightOrderBy() {
    var orderby = JSON.parse(localStorage.getItem('order'));
    if (orderby[0].order) {
        document.getElementById('orderby').value = orderby[0].order;
    }
}

function remove_filters() {
    localStorage.removeItem('filters');
    localStorage.removeItem('brand_filter');
    localStorage.removeItem('category_filter');
    localStorage.removeItem('type_motor_filter');
    localStorage.removeItem('search');
    localStorage.removeItem('order');
    location.reload();
}

function load_map_shop() {
    var position = { lat: 40.416705, lng: -3.7035825 };
    mapboxgl.accessToken = 'pk.eyJ1IjoidmljZW50MjkiLCJhIjoiY2t6eWhiOXFmMDBkbzNqcGI3dzV2Y2pkYSJ9.Ryh_RUFmGLZV-VNy8Ompkw';
    map = new mapboxgl.Map({
        container: 'div_map_shop', // container ID
        style: 'mapbox://styles/mapbox/streets-v11', // style URL
        center: position, // starting position [lng, lat]
        zoom: 5 // starting zoom
    });
    map.addControl(new mapboxgl.NavigationControl());
    map.addControl(new mapboxgl.FullscreenControl());
}

function load_map_details(data) {
    //Mejora para que el popup del details este centrado en la pantalla y el popup se vea dentro del mapa sin tener que moverse.
    var lat = (data.lat - 0.10);
    var position = [data.lon, lat];
    mapboxgl.accessToken = 'pk.eyJ1IjoidmljZW50MjkiLCJhIjoiY2t6eWhiOXFmMDBkbzNqcGI3dzV2Y2pkYSJ9.Ryh_RUFmGLZV-VNy8Ompkw';
    map = new mapboxgl.Map({
        container: 'div_map_details', // container ID
        style: 'mapbox://styles/mapbox/streets-v11', // style URL
        center: position, // starting position [lng, lat]
        zoom: 9 // starting zoom
    });
    map.addControl(new mapboxgl.NavigationControl());
    map.addControl(new mapboxgl.FullscreenControl());
}

function addMarker_map(data, opc) {
    if (opc == "list") {
        popup = new mapboxgl.Popup({ offset: 25 }).setHTML(
            "<div class='more_info_popup'>" +
            "<img src='" + data.img_car + "'></img>" +
            "<h4><b>" + data.id_brand + " " + data.name_model + "</b></h4>" +
            "<table id='table-shop'> <tr>" +
            "<td> <i class='fa-solid fa-location-dot fa-xl'></i> &nbsp;" + data.city + "</td>" +
            "<td> <i id='col-ico' class='fa-solid fa-road fa-xl'></i> &nbsp;" + data.Km + " KM" + "</td>  </tr>" +
            "<td> <i id='col-ico' class='fa-solid fa-palette fa-xl'></i> &nbsp;" + data.color + "</td>" +
            "<td ><i class='fa-solid fa-coins fa-xl'></i> &nbsp;" + data.price + " €" + "</td></tr>" +
            "</table>" +
            "<button class='more_info_list' id='" + data.id_car + "'>MORE INFO</button>" +
            "<div/>"
        );
    } else if (opc == "details") {
        popup = new mapboxgl.Popup({ offset: 25 }).setHTML(
            "<img src='" + data.img_car + "'></img>" +
            "<h4><b>" + data.id_brand + " " + data.name_model + "</b></h4>" +
            "<table id='table-shop'> <tr>" +
            "<td> <i class='fa-solid fa-location-dot fa-xl'></i> &nbsp;" + data.city + "</td>" +
            "<td> <i id='col-ico' class='fa-solid fa-road fa-xl'></i> &nbsp;" + data.Km + " KM" + "</td>  </tr>" +
            "<td> <i id='col-ico' class='fa-solid fa-palette fa-xl'></i> &nbsp;" + data.color + "</td>" +
            "<td ><i class='fa-solid fa-coins fa-xl'></i> &nbsp;" + data.price + " €" + "</td></tr>" +
            "</table>"
        );
    }
    marker = new mapboxgl.Marker()
        .setPopup(popup)
        .setLngLat([data.lon, data.lat])
        .addTo(map);
}

function load_mapbox_variables() {
    const map = null;
    const marker = null;
    const popup = null;
}

function load_brand_filter() {
    var array_brand = JSON.parse(localStorage.getItem('brand_filter'));
    var brand = array_brand[0].name_brand[0];

    ajaxForSearch('module/1_shop/ctrl/ctrl_shop.php?op=home_filter&opc=brand&brand=' + brand);
}

function load_category_filter() {
    console.log("soy los category filtros");
    var array_category = JSON.parse(localStorage.getItem('category_filter'));
    var category = array_category[0].category_home[0];

    ajaxForSearch('module/1_shop/ctrl/ctrl_shop.php?op=home_filter&opc=cate&category=' + category);
}

function load_motor_filter() {
    var array_tmotor = JSON.parse(localStorage.getItem('type_motor_filter'));
    var motor = array_tmotor[0].name_tmotor[0];

    ajaxForSearch('module/1_shop/ctrl/ctrl_shop.php?op=home_filter&opc=tmotor&motor=' + motor);
}

function load_search() {
    var search = JSON.parse(localStorage.getItem('search'));
    ajaxPromise('module/1_shop/ctrl/ctrl_shop.php?op=search_filter', 'POST', 'JSON', { 'search': search })
        .then(function(data) {
            console.log(data);
            $('#content_shop_cars').empty();
            $('.date_car' && '.date_img').empty();
            $('#div_map_details').hide();

            //Mejora para que cuando no hayan resultados en los filtros aplicados
            if (data == "error") {
                $('<div></div>').appendTo('#content_shop_cars')
                    .html(
                        '<h3>¡No se encuentarn resultados con los filtros aplicados!</h3>'
                    )
            } else {
                load_map_shop();
                for (row in data) {

                    $('<div></div>').attr({ 'id': data[row].id_car, class: 'list_content_shop' }).appendTo('#content_shop_cars')
                        .html(
                            "<div class='list_product'>" +
                            "<div class='img-container'>" +
                            "<img src= '" + data[row].img_car + "'" + "</img>" +
                            "</div>" +
                            "<div class='product-info'>" +
                            "<div class='product-content'>" +
                            "<h1><b>" + data[row].id_brand + " " + data[row].name_model + "<a class='list__heart' id='" + data[row].id_car + "'><i id= " + data[row].id_car + " class='fa-solid fa-heart fa-lg'></i></a>" + "</b></h1>" +
                            "<p>Up-to-date maintenance and revisions</p>" +
                            "<ul>" +
                            "<li> <i id='col-ico' class='fa-solid fa-road fa-xl'></i>&nbsp;&nbsp;" + data[row].Km + " KM" + "</li>" +
                            "<li> <i id='col-ico' class='fa-solid fa-person fa-xl'></i>&nbsp;&nbsp;&nbsp;" + data[row].gear_shift + "</li>" +
                            "<li> <i id='col-ico' class='fa-solid fa-palette fa-xl'></i>&nbsp;" + data[row].color + "</li>" +
                            "</ul>" +
                            "<div class='buttons'>" +
                            "<a class='button add' href='#'>Add to Cart</a>" +
                            "<a class='button buy' href='#'>Buy</a>" +
                            "<span class='button' id='price'>" + data[row].price + '€' + "</span>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</div>"
                        )
                    addMarker_map(data[row], "list");
                }
            }
        }).catch(function() {
    console.log('error load_search');
        });
}

function save_orderby() {
    $(document).on('click', '.order-btn', function() {
        var orderby = [];

        if ($('#orderby').val() == 0) {
            orderby.push({ "order": '0' });
        } else {
            orderby.push({ "order": $('#orderby').val() });
        }

        localStorage.removeItem('filters');
        localStorage.removeItem('brand_filter');
        localStorage.removeItem('category_filter');
        localStorage.removeItem('type_motor_filter');
        localStorage.removeItem('search');

        localStorage.setItem('order', JSON.stringify(orderby));
        window.location.href = 'index.php?page=tienda';
    });
}

function load_orderby(total_prod = 0, items_page = 4) {
    var all_orderby = JSON.parse(localStorage.getItem('order'));
    var one_orderby = all_orderby[0].order;

    ajaxForSearch('module/1_shop/ctrl/ctrl_shop.php?op=order_filter&order=' + one_orderby, total_prod, items_page);
}

function load_pagination() {
    if (localStorage.getItem('filters')) {
        var all_filters = JSON.parse(localStorage.getItem('filters'));
        var color = all_filters[0].Color;
        var doors = all_filters[1].Num_doors[0];
        var category = all_filters[2].category[0];

        var url = 'module/1_shop/ctrl/ctrl_shop.php?op=count_entr_filters&color=' + color + '&doors=' + doors + '&category=' + category;
    } else if (localStorage.getItem('brand_filter')) {
        console.log("Paginación marcas home");
    } else if (localStorage.getItem('category_filter')) {
        console.log("Paginación categorias home");
    } else if (localStorage.getItem('type_motor_filter')) {
        console.log("Paginación tipos coches home");
    } else if (localStorage.getItem('search')) {
        console.log("Paginación search");
    } else if (localStorage.getItem('order')) {
        var value_orderby = JSON.parse(localStorage.getItem('order'));
        var url = 'module/1_shop/ctrl/ctrl_shop.php?op=count_order_filter';
        var sdata = { 'value_orderby': value_orderby }
    } else {
        var url = "module/1_shop/ctrl/ctrl_shop.php?op=count_entr_pag";
    }
    ajaxPromise(url, 'POST', 'JSON', sdata)
        .then(function(data) {
            var total_prod = data[0].n_prod;

            if (total_prod >= 4) {
                total_pages = Math.ceil(total_prod / 4);
            } else {
                total_pages = 1;
            }

            $('#pagination').bootpag({
                total: total_pages,
                page: localStorage.getItem('page') ? localStorage.getItem('page') : 1,
                maxVisible: total_pages
            }).on('page', function(event, num) {
                localStorage.setItem('page', num);
                localStorage.removeItem('id_car');
                total_prod = 4 * (num - 1);
                if (total_prod == 0) {
                    localStorage.setItem('total_prod', 0)
                }
                loadCars(total_prod, 4);
                $('html, body').animate({ scrollTop: $(".list__content") });
            });
        }).catch(function() {
            console.log('Fail pagination');
        });
}

function cars_related(loadeds = 0, type_car, total_items) {
    let items = 3;
    let loaded = loadeds;
    let type = type_car;
    let total_item = total_items;

    ajaxPromise("module/1_shop/ctrl/ctrl_shop.php?op=entr_related", 'POST', 'JSON', { 'type': type, 'loaded': loaded, 'items': items })
        .then(function(data) {
            if (loaded == 0) {
                $('<div></div>').attr({ 'id': 'title_content', class: 'title_content' }).appendTo('.results')
                    .html(
                        '<h2 class="cat">Cars related</h2>'
                    )
                for (row in data) {
                    if (data[row].id_car != undefined) {
                        $('<div></div>').attr({ 'id': data[row].id_car, 'class': 'more_info_list' }).appendTo('.title_content')
                            .html(
                                "<li class='portfolio-item'>" +
                                "<div class='item-main'>" +
                                "<div class='portfolio-image'>" +
                                "<img src = " + data[row].img_car + " alt='imagen car' </img> " +
                                "</div>" +
                                "<h5>" + data[row].id_brand + "  " + data[row].name_model + "</h5>" +
                                "</div>" +
                                "</li>"
                            )
                    }
                }
                $('<div></div>').attr({ 'id': 'more_car__button', 'class': 'more_car__button' }).appendTo('.title   _content')
                    .html(
                        '<button class="load_more_button" id="load_more_button">LOAD MORE</button>'
                    )
            }
            if (loaded >= 3) {
                for (row in data) {
                    if (data[row].id_car != undefined) {
                        console.log(data);
                        $('<div></div>').attr({ 'id': data[row].id_car, 'class': 'more_info_list' }).appendTo('.title_content')
                            .html(
                                "<li class='portfolio-item'>" +
                                "<div class='item-main'>" +
                                "<div class='portfolio-image'>" +
                                "<img src = " + data[row].img_car + " alt='imagen car' </img> " +
                                "</div>" +
                                "<h5>" + data[row].id_brand + "  " + data[row].name_model + "</h5>" +
                                "</div>" +
                                "</li>"

                            )
                    }
                }
                var total_cars = total_item - 3;
                if (total_cars <= loaded) {
                    $('.more_car__button').empty();
                    $('<div></div>').attr({ 'id': 'more_car__button', 'class': 'more_car__button' }).appendTo('.title_content')
                        .html(
                            "</br><button class='btn-notexist' id='btn-notexist'></button>"
                        )
                } else {
                    $('.more_car__button').empty();
                    $('<div></div>').attr({ 'id': 'more_car__button', 'class': 'more_car__button' }).appendTo('.title_content')
                        .html(
                            '<button class="load_more_button" id="load_more_button">LOAD MORE</button>'
                        )
                }
            }
        }).catch(function() {
            console.log("error cars_related");
        });
}

function more_cars_related(type_car) {
    var type_car = type_car;
    var items = 0;
    ajaxPromise('module/1_shop/ctrl/ctrl_shop.php?op=count_entr_related', 'POST', 'JSON', { 'type_car': type_car })
        .then(function(data) {
            var total_items = data[0].n_prod;
            cars_related(0, type_car, total_items);
            $(document).on("click", '.load_more_button', function() {
                items = items + 3;
                $('.more_car__button').empty();
                cars_related(items, type_car, total_items);
            });
        }).catch(function() {
            console.log('error total_items');
        });
}

$(document).ready(function() {
    loadEntradas();
    clicks();
    load_filter();
    $('#btn-back-list').on('click', function() {
    $('#shop-detail-view').hide();  
    $('#shop-list-view').show()});
});
