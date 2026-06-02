function load_Equipos() {
    ajaxPromise('module/home/controller/ctrl_home.php?op=getEquipos', 'GET', 'JSON')
    .then(function(data) {
        if (data == "error") return;

        for (var row in data) {

            $('<div></div>').addClass('swiper-slide').appendTo('#slides-equipos')
            .html(
                '<div class="slide-equipo" style="background:#1a1a1a">' +
                    '<div class="slide-equipo__logo" style="background:' + data[row].color_principal + '">' +
                        '<img src="' + data[row].imagen_logo + '" ' +
                             'onerror="this.style.display=\'none\';this.nextElementSibling.style.display=\'flex\'">' +
                        '<span class="fb">' + data[row].abreviacion + '</span>' +
                    '</div>' +
                    '<div class="slide-equipo__name">' + data[row].nombre + '</div>' +
                    '<div class="slide-equipo__conf">' + data[row].conferencia + '</div>' +
                '</div>'
            );
        }
                new Swiper('.swiper-equipos', {
                    slidesPerView: 3,
                    spaceBetween: 12,
                    navigation: {
                        nextEl: '.swiper-equipos .swiper-button-next',
                        prevEl: '.swiper-equipos .swiper-button-prev'
                    },
                    breakpoints: { 
                        768:  { slidesPerView: 5 }, 
                        1024: { slidesPerView: 7 } 
                    }
                });
    })
    .catch(function() {
        console.log('Error cargando equipos');
    });
}

function load_categorias() {
    ajaxPromise('module/home/controller/ctrl_home.php?op=getCategorias', 'GET', 'JSON')
    .then(function(data) {
        for (var row in data) {
            $('<div></div>').addClass('swiper-slide').appendTo('#slides-categorias')
            .html(
                '<div class="slide-categoria">' +
                '<div class="slide-categoria__name">' + data[row].nombre + '</div>' +
                '<div class="slide-categoria__nivel">' + data[row].nivel + '</div>' +
                '</div>'
            );
        }
        new Swiper('.swiper-categorias', {
            slidesPerView: 3,
            spaceBetween: 12,
            navigation: {
                nextEl: '.swiper-categorias .swiper-button-next',
                prevEl: '.swiper-categorias .swiper-button-prev'
            },
            breakpoints: { 768: { slidesPerView: 5 }, 1024: { slidesPerView: 8 } }
        });
    }).catch(function() {
        console.log('error categorias');
    });
}

function load_jugadores() {
    ajaxPromise('module/home/controller/ctrl_home.php?op=getJugadores', 'GET', 'JSON')
    .then(function(data) {
        for (var row in data) {
            $('<div></div>').addClass('swiper-slide').appendTo('#slides-jugadores')
            .html(
                '<div class="slide-jugador">' +
                '<div class="slide-jugador__avatar">' +
                '<img src="' + data[row].imagen_url + '">' +
                '</div>' +
                '<div class="slide-jugador__info">' +
                '<div class="slide-jugador__num">#' + data[row].numero_camiseta + '</div>' +
                '<div class="slide-jugador__name">' + data[row].nombre + ' ' + data[row].apellido + '</div>' +
                '<div class="slide-jugador__pos">' + data[row].posicion + '</div>' +
                '</div>' +
                '</div>'
            );
        }
        new Swiper('.swiper-jugadores', {
            slidesPerView: 2,
            spaceBetween: 12,
            navigation: {
                nextEl: '.swiper-jugadores .swiper-button-next',
                prevEl: '.swiper-jugadores .swiper-button-prev'
            },
            breakpoints: { 768: { slidesPerView: 3 }, 1024: { slidesPerView: 4 } }
        });
    }).catch(function() {
        console.log('error jugadores');
    });
}
function load_Eventos() {
    ajaxPromise('module/home/controller/ctrl_home.php?op=getEventos', 'GET', 'JSON')
    .then(function(data) {
        for (var row in data) {
            $('<div></div>').addClass('swiper-slide').appendTo('#slides-eventos')
            .html(
                '<div class="slide-evento">' +
                '<div class="slide-evento__bg" style="background-image:url(' + data[row].imagen_url + ')"></div>' +
                '<div class="slide-evento__overlay"></div>' +
                '<div class="slide-evento__badge">' + data[row].tipo + '</div>' +
                '<div class="slide-evento__title">' + data[row].nombre + '</div>' +
                '<div class="slide-evento__meta">' + data[row].fecha_inicio + ' · ' + data[row].nombre_ciudad + '</div>' +
                '</div>'
            );
        }
        new Swiper('.swiper-eventos', {
            slidesPerView: 3,
            spaceBetween: 12,
            navigation: {
                nextEl: '.swiper-eventos .swiper-button-next',
                prevEl: '.swiper-eventos .swiper-button-prev'
            },
            breakpoints: { 768: { slidesPerView: 4 }, 1024: { slidesPerView: 5 } }
        });
    }).catch(function() {
        console.log('error eventos');
    });
}

function load_Partidos() {
    ajaxPromise('module/home/controller/ctrl_home.php?op=getPartidos', 'GET', 'JSON')
    .then(function(data) {
        for (var row in data) {
            $('<div></div>').addClass('swiper-slide').appendTo('#slides-partidos')
            .html(
                '<div class="slide-partido">' +
                '<div class="slide-partido__teams">' +
                '<div class="slide-partido__team">' +
                '<div class="slide-partido__badge" style="background:' + data[row].color_local + '">' +
                '<img src="' + data[row].logo_local + '">' +
                '</div>' +
                '<span class="slide-partido__team-name">' + data[row].nombre_local + '</span>' +
                '</div>' +
                '<div class="slide-partido__center">' +
                '<span class="slide-partido__score">' + data[row].puntos_local + ' - ' + data[row].puntos_visitante + '</span>' +
                '</div>' +
                '<div class="slide-partido__team">' +
                '<div class="slide-partido__badge" style="background:' + data[row].color_visitante + '">' +
                '<img src="' + data[row].logo_visitante + '">' +
                '</div>' +
                '<span class="slide-partido__team-name">' + data[row].nombre_visitante + '</span>' +
                '</div>' +
                '</div>' +
                '<div class="slide-partido__meta">' + data[row].fecha + ' · ' + data[row].estado + '</div>' +
                '</div>'
            );
        }
        new Swiper('.swiper-partidos', {
            slidesPerView: 2,
            spaceBetween: 12,
            navigation: {
                nextEl: '.swiper-partidos .swiper-button-next',
                prevEl: '.swiper-partidos .swiper-button-prev'
            },
            breakpoints: { 768: { slidesPerView: 3 }, 1024: { slidesPerView: 4 } }
        });
    }).catch(function() {
        console.log('error partidos');
    });
}

function clicks() {
    $(document).on('click', '.slide-equipo', function() {
        var filters = [];
        filters.push({"marca": [$(this).find('.slide-equipo__name').text()]});
        localStorage.removeItem('filters');
        localStorage.setItem('filters', JSON.stringify(filters));
        setTimeout(function() {
            window.location.href = 'index.php?page=controller_shop&op=view';
        }, 1000);
    });

    $(document).on('click', '.slide-categoria', function() {
        var filters = [];
        filters.push({"categoria": [$(this).find('.slide-categoria__name').text()]});
        localStorage.removeItem('filters');
        localStorage.setItem('filters', JSON.stringify(filters));
        setTimeout(function() {
            window.location.href = 'index.php?page=controller_shop&op=view';
        }, 1000);
    });
}

$(document).ready(function() {
    load_Equipos();
    load_categorias();
    load_jugadores();
    load_Eventos();
    load_Partidos();
    clicks();
});
