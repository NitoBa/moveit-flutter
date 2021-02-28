let permission;

async function notification(body) {

    if (permission !== 'granted') {
        alert("Para receber notificações é preciso conceder permissões");
    } else {

        new Notification("Move.it | Flutter", {
            body: body,
            icon: '../assets/images/favicon.png',
            renotify: false,
        })
    }
}

async function initNotification() {
    permission = await Notification.requestPermission();
}