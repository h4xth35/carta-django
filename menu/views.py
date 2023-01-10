from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required

# Create your views here.
from menu.models import *

def home(request):
    return render(request, 'home.html')

@login_required
def dashboard(request):

    data = {
        'title': 'Admin Panel MiCartaFacil',
        'restaurantes': Restaurant.objects.all(),
        'activos_restaurantes': Restaurant.objects.filter(status=True),
        'inactivos_restaurantes': Restaurant.objects.filter(status=False),
        # menu filter by restaurant
        'menus': Menu.objects.all(),
        'categoria': Category.objects.all(),
        'alergenos': Alergenos.objects.all(),
    }
    i=0
    lista = {}

    for r in data['restaurantes']:
        for x in data['menus']:
            if x.restaurant.id == r.id:
                i=i+1
        
        lista[r.id]=i
        i=0

    data['contador'] = lista
    return render(request, 'dashboard.html', data)


@login_required
def view_restaurant(request, id):
    restaurant = Restaurant.objects.get(id=id)
    proto, host = request.META.get('SERVER_PROTOCOL'), request.META.get('HTTP_HOST')
    if proto[4] == '/' :
        num = 4
    else:
        num = 5
    url = f"{proto[0:num].lower()}://{host}/{restaurant.name_url}"

    data = {
        'title': 'Restaurant',
        'restaurant': restaurant,
        'menu': Menu.objects.filter(restaurant=restaurant),
        'categoria': Category.objects.all(),
        'alergenos': Alergenos.objects.all(),
        'restaurantes': Restaurant.objects.all(),
        'url' : url

    }

    return render(request, 'restaurant.html', data)

@login_required
def delete_restaurant(request, id):
    restaurant = Restaurant.objects.get(id=id)

    restaurant.favicon.delete()
    restaurant.logo.delete()

    restaurant.delete()
    messages.info(request, 'Restaurante eliminado con éxito')
    return redirect(f'/dashboard')

@login_required
def delete_menus(request, id):
    menu = Menu.objects.get(id=id)
    menu.delete()
    messages.info(request, 'Menu eliminado con éxito')
    return redirect(f'/{menu.restaurant.id}')


def carta(request,url):
    restaurant = Restaurant.objects.filter(name_url=url)[0]
    if restaurant.status:
        categories = set(Menu.objects.filter(restaurant=restaurant).values_list('category__name', flat=True))

        data = {
            'title': restaurant.name,
            'restaurant': restaurant,
            'menu': Menu.objects.filter(restaurant=restaurant),
            'categories': categories,
            'banners': Banner.objects.filter(restaurant=restaurant).order_by('banner_number'),

        }

        return render(request, 'carta/carta.html', data)
    else:
        return render(request, 'includes/mantenimiento.html')

@login_required
def menu(request):
    data = {
        'title': 'Example Menu',
    }

    return render(request, 'carta/menu.html', data)

@login_required
def newres(request):

    nombre = request.POST['nombre']
    descripcion = request.POST['descripcion']
    precio = request.POST['precio']
    categoria = request.POST.getlist('categoria')
    alergeno = request.POST.getlist('alergeno')
    restaurante = request.POST['restaurante']   

    res = Restaurant.objects.get(id = restaurante)

    menu = Menu.objects.create(name = nombre, description = descripcion, price = precio, restaurant = res)

    for x in categoria:
        cat = Category.objects.get(id = x)
        menu.category.add(cat)

    for x in alergeno:
        al = Alergenos.objects.get(id = x)
        menu.alergenos.add(al)

    menu.save()

    messages.info(request, 'Menu creado con éxito')

    response = f'/retaurante/{res.id}'
    
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    # return redirect(response)

@login_required
def actualizar_menu(request, id):
    menu = Menu.objects.get(id = id)

    nombre = request.POST['nombre']
    descripcion = request.POST['descripcion']
    precio = request.POST['precio']
    categoria = request.POST.getlist('categoria')
    alergeno = request.POST.getlist('alergenos') 

    menu.name = nombre
    menu.description = descripcion
    menu.price = precio

    menu.category.clear()
    menu.alergenos.clear()
    for x in categoria:
        cat = Category.objects.get(id = x)
        menu.category.add(cat)

    for x in alergeno:
        al = Alergenos.objects.get(id = x)
        menu.alergenos.add(al)

    menu.save()

    messages.info(request, 'Menu editado con éxito')

    response = f'/restaurante/{menu.restaurant.id}'
    
    return redirect(response)
    
    return HttpResponse(menu.alergenos.all())

@login_required
def crear_restaurant(request):

    if request.method == 'POST':

        nombre = request.POST['nombre']
        direccion = request.POST['direccion']
        telefono = request.POST['telefono']
        whatsapp = request.POST['whatsapp']
        correo = request.POST['correo']
        tiempo = request.POST['tiempo']
        facebook = request.POST['facebook']
        twitter = request.POST['twitter']
        instagram = request.POST['instagram']
        youtube = request.POST['youtube']
        url = request.POST['url']
        icono = None
        logo = None

        try:
            icono = request.FILES['icono']
        except:
          print('An exception occurred')
                    
        try:
            logo = request.FILES['logo']
        except:
          print('An exception occurred')

        if telefono.isdigit() and nombre != '':
            if Restaurant.objects.filter(name_url=url).count() != 0:
                messages.error(request, 'La url debe ser unica')
                return redirect('/')

            restaurant = Restaurant.objects.create(
                            name = nombre, 
                            address = direccion, 
                            favicon = icono,
                            logo = logo, 
                            phone = telefono,
                            whatsapp = whatsapp, 
                            email = correo, 
                            time = tiempo, 
                            facebook = facebook, 
                            twitter = twitter,
                            instagram = instagram, 
                            youtube = youtube, 
                            name_url = url)

            messages.success(request, 'Restaurante Creado con éxito')

            restaurant.save()
            response = f'/dashboard'
            
            return redirect(response)
        else:
            messages.error(request, 'Debe completar el formulario')
            return redirect('/dashboard')

    else:
        return HttpResponse('method get')

@login_required
def change_status(request, idd):
    res = Restaurant.objects.get(id=idd)

    if res.status == False :
        res.status = True
    else:
        res.status = False

    res.save()
    messages.info(request, f'Estado de "{res.name.upper()}" cambiado')
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    # return redirect(f'/restaurante/{res.id}')

@login_required
def editar_restaurant(request, idd):
    
    data = {
        'restaurant': Restaurant.objects.get(id=idd),
    }

    return render(request, 'editar/restaurante.html', data)

@login_required
def editar_menu(request, idd):

    data = {
        'menu': Menu.objects.get(id=idd),
        'categoria': Category.objects.all(),
        'alergenos': Alergenos.objects.all(),
    }

    return render(request, 'editar/menu.html', data)

@login_required
def actualizar_restaurant(request, idd):
    restaurant = Restaurant.objects.get(id=idd)

    if request.method == 'POST':

        nombre = request.POST['nombre']
        direccion = request.POST['direccion']
        telefono = request.POST['telefono']
        whatsapp = request.POST['whatsapp']
        correo = request.POST['correo']
        tiempo = request.POST['tiempo']
        facebook = request.POST['facebook']
        twitter = request.POST['twitter']
        instagram = request.POST['instagram']
        youtube = request.POST['youtube']
        url = request.POST['url']
        icono = None
        logo = None

        try:
            icono = request.FILES['icono']
            restaurant.favicon.delete()
            restaurant.favicon = icono
        except:
            print('error al subir foto')
                    
        try:
            logo = request.FILES['logo']
            restaurant.logo.delete()
            restaurant.logo = logo
        except:
            print('error al subir foto')

        if telefono.isdigit() and nombre != '':
            if Restaurant.objects.filter(name_url=url).count() != 0:
                if restaurant.name_url != url:
                    messages.error(request, 'La url debe ser unica')
                    return redirect('/')

            restaurant.name = nombre
            restaurant.address = direccion
            restaurant.phone = telefono
            restaurant.whatsapp = whatsapp 
            restaurant.email = correo 
            restaurant.time = tiempo
            restaurant.facebook = facebook
            restaurant.twitter = twitter
            restaurant.instagram = instagram 
            restaurant.youtube = youtube 
            restaurant.name_url = url

            messages.success(request, 'Restaurante editado con éxito')

            restaurant.save()
            response = f'/restaurante/{restaurant.id}'
            
            return redirect(response)
        else:
            messages.error(request, 'Debe completar el formulario correctamente')
            return redirect(f'/restaurante/{restaurant.id}')

    else:
        return HttpResponse('method get')

@login_required
def categorias(request):
    data = {
        'categorias': Category.objects.all()
    }
    template_name = "categoria/index.html"

    return render(request, template_name, data)

@login_required
def alergenos(request):
    data = {
        'alergenos': Alergenos.objects.all()
    }
    template_name = "alergeno/index.html"

    return render(request, template_name, data)

@login_required
def delete_categoria(request, id):
    menu = Category.objects.get(id=id)
    menu.delete()
    messages.info(request, 'Categoria eliminada con éxito')
    return redirect(f'/categorias/')

@login_required
def delete_alergeno(request, id):
    menu = Alergenos.objects.get(id=id)
    menu.image.delete()
    menu.delete()
    messages.info(request, 'Alergeno eliminado con éxito')
    return redirect(f'/alergenos/')
    
@login_required
def categoria_store(request):
    nombre = request.POST['nombre']

    cat = Category.objects.create(
        name = nombre
    )

    cat.save()

    messages.success(request, 'Categoría creada con éxito')

    return redirect(f'/categorias/')

@login_required
def actualizar_categoria(request, id):
    categoria = Category.objects.get(id=id)
    categoria.name = request.POST['nombre']
    categoria.save()
    messages.success(request, 'Categoría editada con éxito')
    return redirect(f'/categorias/')

@login_required
def alergeno_store(request):
    nombre = request.POST['nombre']
    imagen = None

    try:
        imagen = request.FILES['imagen']
    except:
        print('An exception occurred')
    

    cat = Alergenos.objects.create(
        name = nombre,
        image = imagen
    )

    cat.save()

    messages.success(request, 'Alergeno creado con éxito')

    return redirect(f'/alergenos/')

@login_required
def actualizar_alergeno(request, id):
    alerg = Alergenos.objects.get(id=id)
    alerg.name = request.POST['nombre']
    
    try:
        imagen = request.FILES['imagen']
        alerg.image.delete()
        alerg.image = imagen
    except:
        print('An exception occurred')

    alerg.save()

    messages.success(request, 'Alergeno editado con éxito')

    return redirect(f'/alergenos/')

@login_required
def banners(request, id):
    data = {
        'restaurante': Restaurant.objects.get(id=id),
        'banners': Banner.objects.filter(restaurant=id)
    }

    return render(request, 'banner/index.html', data)   

@login_required
def banners_store(request):
    name = request.POST['nombre']
    title = request.POST['titulo']
    description = request.POST['descripcion']
    imagen = None
    button = request.POST['boton']
    banner_number = request.POST['orden']
    restaurant = Restaurant.objects.get(id=request.POST['restaurant'])

    try:
        imagen = request.FILES['imagen']
    except:
        print('An exception occurred')

    banner = Banner.objects.create(
        name=name,
        title=title,
        description=description,
        image=imagen,
        button=button,
        banner_number=banner_number,
        restaurant=restaurant)
    
    messages.info(request, 'Banner creado con éxito')
    return redirect(f'../banners/{banner.restaurant.id}')

def delete_banner(request, id):
    banner = Banner.objects.get(id=id)
    banner.image.delete()
    banner.delete()

    messages.info(request, 'Banner eliminado con éxito')
    return redirect(f'../{banner.restaurant.id}')

def editar_banner(request, id):
    data = {
        'banner': Banner.objects.get(id=id),
        }

    return render(request, 'banner/editar.html', data)

def update_banner(request, id):
    return 0