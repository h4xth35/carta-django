document.querySelector("#submit").addEventListener("click", e => {
	e.preventDefault();
	let whatsapp = document.querySelector("#whatsapp").value;
	let telefono = document.querySelector("#telefono").value;
	let restaurante = document.querySelector("#restaurante").value;
	let cliente = document.querySelector("#cliente").value;
	let numero = document.querySelector("#numero").value;
	let fecha = document.querySelector("#fecha").value;
	let hora = document.querySelector("#hora").value;
	let resp = document.querySelector("#respuesta");
	resp.classList.remove("fail");
	resp.classList.remove("send");
	let url = `https://api.whatsapp.com/send?phone=${whatsapp}&text=
		*${restaurante}
		*Reservas*%0A%0A
		*¿Cuál es tu nombre?*%0A
		${cliente}%0A
		*¿Numero de Comensales?*%0A
		${numero}%0A
		*Indica la fecha de tu reserva*%0A
		${fecha}%0A
		*Indica la hora de tu reserva*%0A
		${hora}%0A%0A
		Le responderemos en la mayor brevedad posible.%0A%0A
		(Si lo desea también puede ponerse en contacto llamando al ${telefono})%0A
		*Muchas Gracias*.`;
	if (cliente === "" || fecha === "" || hora === "") {
		resp.classList.add("fail");
		resp.innerHTML = `Faltan algunos datos, ${cliente}`;
		return false;
	}
	resp.classList.remove("fail");
	resp.classList.add("send");
	resp.innerHTML = `Se ha enviado tu reserva, ${cliente}`;
	window.open(url);
});
