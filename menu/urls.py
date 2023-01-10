from django.urls import path, include
from django.contrib import admin
from . import views

urlpatterns = [
    
    path('', views.home, name='home'),
    path('dashboard', views.dashboard, name='dashboard'),
    path('example', views.menu, name='example'),

    #Banner
    path('banners/<int:id>', views.banners, name='banners'),
    path('banners/store', views.banners_store, name='banners_store'),
    path('banners/editar/<int:id>', views.editar_banner, name='editar_banner'),
    path('banners/update/<int:id>', views.update_banner, name='update_banner'),
    path('banners/delete/<int:id>', views.delete_banner, name='delete_banner'),

    # Categorias
    path('categorias/', views.categorias, name='categorias'),
    path('categoria/store', views.categoria_store, name='categoria_store'),
    path('delete_categoria/<int:id>', views.delete_categoria, name='delete_categoria'),
    path('actualizar_categoria/<int:id>', views.actualizar_categoria, name='actualizar_categoria'),

    # Alergenos
    path('alergenos/', views.alergenos, name='alergenos'),
    path('delete_alergeno/<int:id>', views.delete_alergeno, name='delete_alergeno'),
    path('alergeno/store', views.alergeno_store, name='alergeno_store'),
    path('actualizar_alergeno/<int:id>', views.actualizar_alergeno, name='actualizar_alergeno'),

    # Restaurante
    path('restaurante/<int:id>', views.view_restaurant, name='view_restaurant'),
    path('<url>', views.carta, name='carta'),
    path('delete/<int:id>', views.delete_restaurant, name='delete_restaurant'),
    path('crear_restaurant/', views.crear_restaurant, name='crear_restaurant'),
    path('editar_restaurant/<int:idd>', views.editar_restaurant, name='editar_restaurant'),
    path('actualizar_restaurant/<int:idd>', views.actualizar_restaurant, name='actualizar_restaurant'),
    path('<int:idd>/change/', views.change_status),
    
    # Menus
    path('editar_menu/<int:idd>', views.editar_menu, name='editar_menu'),
    path('actualizar_menu/<int:id>', views.actualizar_menu, name='actualizar_menu'),
    path('delete_menu/<int:id>', views.delete_menus, name='delete_menus'),
    path('newres/', views.newres, name='new_res'),
]