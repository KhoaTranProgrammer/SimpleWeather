import QtQuick 2.0

Item {
    id: root
    anchors.fill: parent

    // Input location for display information
    property string searchFor: ""

    // Store location information
    property string location: qsTr("location")
    property string city: qsTr("")
    property string country: qsTr("")
    property string region: qsTr("")

    // Store wind information
    property string wind: qsTr("Wind")
    property string chill: qsTr("")
    property string direction: qsTr("")
    property string speed: qsTr("")

    // Store atmosphere information
    property string atmosphere: qsTr("Atmosphere")
    property string humidity: qsTr("")
    property string pressure: qsTr("")
    property string rising: qsTr("")
    property string visibility: qsTr("")

    // Store astronomy information
    property string astronomy: qsTr("Astronomy")
    property string sunrise: qsTr("")
    property string sunset: qsTr("")

    // Process to return the main screen
    signal back

    // Background
    Rectangle {
        anchors.fill: parent

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#E8F5E9" }
            GradientStop { position: 0.1; color: "#C8E6C9" }
            GradientStop { position: 0.2; color: "#A5D6A7" }
            GradientStop { position: 0.3; color: "#81C784" }
            GradientStop { position: 0.4; color: "#66BB6A" }
            GradientStop { position: 0.5; color: "#4CAF50" }
            GradientStop { position: 0.6; color: "#43A047" }
            GradientStop { position: 0.7; color: "#388E3C" }
            GradientStop { position: 0.8; color: "#2E7D32" }
            GradientStop { position: 0.9; color: "#1B5E20" }
            GradientStop { position: 1.0; color: "#B9F6CA" }
        }
    }

    // Shows location
    Text {
        id: locationTitle
        anchors {
            left: parent.left
            leftMargin: parent.width * 0.01
            top: parent.top
            topMargin: parent.height * 0.01
        }
        text: city + " - " + country
        font.pixelSize: parent.height * 0.07
    }

    // Shows Date
    Text {
        id: dateTitle
        anchors {
            top: locationTitle.bottom
            left: parent.left
            leftMargin: parent.width * 0.01
        }
        font.pixelSize: parent.height * 0.035
    }

    // Shows weather state
    Image {
        id: weatherState
        anchors {
            right: parent.right
            top: parent.top
            bottom: locationTitle.bottom
        }
        fillMode: Image.PreserveAspectFit
        source: "image/3200.png"
    }

    // Shows weather description
    Text {
        id: weatherDescription
        anchors {
            right: weatherState.left
            rightMargin: parent.width * 0.01
            verticalCenter: weatherState.verticalCenter
        }
        font.pixelSize: parent.height * 0.07
    }

    // Shows temperature
    Text {
        id: temperature
        anchors {
            right: weatherDescription.left
            rightMargin: parent.width * 0.01
            verticalCenter: weatherDescription.verticalCenter
        }
        font.pixelSize: parent.height * 0.07
    }

    // Shows wind
    Rectangle {
        id: windTitle
        anchors {
            top: locationTitle.bottom
            topMargin: parent.height * 0.05
            left: parent.left
            leftMargin: parent.width * 0.025
        }
        width: parent.width * 0.3
        height: parent.height * 0.1
        radius: height / 5
        border.color: "#FDD835"
        border.width: height / 10

        color: "black"

        Text {
            anchors.centerIn: parent
            text: wind
            color: "#FDD835"
            font.pixelSize: parent.height / 1.5
        }
    }

    Rectangle {
        id: windDetail
        anchors {
            top: windTitle.bottom
            left: windTitle.left
            right: windTitle.right
        }
        height: parent.height * 0.6
        radius: windTitle.radius
        border.color: "black"
        border.width: windTitle.border.width

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#FFF59D" }
            GradientStop { position: 0.3; color: "#FFEE58" }
            GradientStop { position: 0.6; color: "#FDD835" }
            GradientStop { position: 1.0; color: "#F9A825" }
        }

        // Chill
        Text {
            id: chillStatic
            anchors {
                left: parent.left
                leftMargin: parent.height * 0.05
                top: parent.top
                topMargin: parent.height * 0.05
            }
            text: qsTr("Chill:")
            font.pixelSize: parent.height * 0.08
        }
        Text {
            id: chillDetail
            anchors {
                top: chillStatic.bottom
                horizontalCenter: parent.horizontalCenter
            }
            text: chill
            font.pixelSize: parent.height * 0.15
        }

        // Direction
        Text {
            id: directionStatic
            anchors {
                top: chillStatic.bottom
                topMargin: parent.height * 0.2
                left: parent.left
                leftMargin: parent.height * 0.05
            }
            text: qsTr("Direction:")
            font.pixelSize: parent.height * 0.08
        }
        Text {
            id: directionDetail
            anchors {
                top: directionStatic.bottom
                horizontalCenter: parent.horizontalCenter
            }
            text: direction
            font.pixelSize: parent.height * 0.15
        }

        // Speed
        Text {
            id: speedDetail
            anchors {
                bottom: parent.bottom
                bottomMargin: parent.height * 0.05
                horizontalCenter: parent.horizontalCenter
            }
            text: speed + " mph"
            font.pixelSize: parent.height * 0.15
        }
        Text {
            id: speedStatic
            anchors {
                left: parent.left
                leftMargin: parent.height * 0.05
                bottom: speedDetail.top
            }
            text: qsTr("Speed:")
            font.pixelSize: parent.height * 0.08
        }
    }

    // Shows atmosphere
    Rectangle {
        id: atmosphereTitle
        anchors {
            top: locationTitle.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: parent.height * 0.05
        }
        width: parent.width * 0.3
        height: parent.height * 0.1
        radius: height / 5
        border.color: "#FDD835"
        border.width: height / 10

        color: "black"

        Text {
            anchors.centerIn: parent
            text: atmosphere
            color: "#FDD835"
            font.pixelSize: parent.height / 1.5
        }
    }

    Rectangle {
        id: atmosphereDetail
        anchors {
            top: atmosphereTitle.bottom
            left: atmosphereTitle.left
            right: atmosphereTitle.right
        }
        height: parent.height * 0.6
        radius: atmosphereTitle.radius
        border.color: "black"
        border.width: atmosphereTitle.border.width

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#FFF59D" }
            GradientStop { position: 0.3; color: "#FFEE58" }
            GradientStop { position: 0.6; color: "#FDD835" }
            GradientStop { position: 1.0; color: "#F9A825" }
        }

        // Humidity
        Text {
            id: humidityStatic
            anchors {
                left: parent.left
                leftMargin: parent.height * 0.05
                top: parent.top
                topMargin: parent.height * 0.05
            }
            text: qsTr("Humidity:")
            font.pixelSize: parent.height * 0.06
        }
        Text {
            id: humidityDetail
            anchors {
                top: humidityStatic.bottom
                horizontalCenter: parent.horizontalCenter
            }
            text: humidity
            font.pixelSize: parent.height * 0.12
        }

        // Pressure
        Text {
            id: pressureStatic
            anchors {
                left: parent.left
                leftMargin: parent.height * 0.05
                top: humidityDetail.bottom
            }
            text: qsTr("Pressure:")
            font.pixelSize: parent.height * 0.06
        }
        Text {
            id: pressureDetail
            anchors {
                top: pressureStatic.bottom
                horizontalCenter: parent.horizontalCenter
            }
            text: pressure
            font.pixelSize: parent.height * 0.12
        }

        // Rising
        Text {
            id: risingStatic
            anchors {
                left: parent.left
                leftMargin: parent.height * 0.05
                top: pressureDetail.bottom
            }
            text: qsTr("Rising:")
            font.pixelSize: parent.height * 0.06
        }
        Text {
            id: risingDetail
            anchors {
                top: risingStatic.bottom
                horizontalCenter: parent.horizontalCenter
            }
            text: rising
            font.pixelSize: parent.height * 0.12
        }

        // Visibility
        Text {
            id: visibilityStatic
            anchors {
                left: parent.left
                leftMargin: parent.height * 0.05
                top: risingDetail.bottom
            }
            text: qsTr("Visibility:")
            font.pixelSize: parent.height * 0.06
        }
        Text {
            id: visibilityDetail
            anchors {
                top: visibilityStatic.bottom
                horizontalCenter: parent.horizontalCenter
            }
            text: visibility
            font.pixelSize: parent.height * 0.12
        }
    }

    // Shows astronomy
    Rectangle {
        id: astronomyTitle
        anchors {
            top: locationTitle.bottom
            topMargin: parent.height * 0.05
            right: parent.right
            rightMargin: parent.width * 0.025
        }
        width: parent.width * 0.3
        height: parent.height * 0.1
        radius: height / 5
        border.color: "#FDD835"
        border.width: height / 10

        color: "black"

        Text {
            anchors.centerIn: parent
            text: astronomy
            color: "#FDD835"
            font.pixelSize: parent.height / 1.5
        }
    }

    Rectangle {
        id: astronomyDetail
        anchors {
            top: astronomyTitle.bottom
            left: astronomyTitle.left
            right: astronomyTitle.right
        }
        height: parent.height * 0.6
        radius: astronomyTitle.radius
        border.color: "black"
        border.width: astronomyTitle.border.width

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#FFF59D" }
            GradientStop { position: 0.3; color: "#FFEE58" }
            GradientStop { position: 0.6; color: "#FDD835" }
            GradientStop { position: 1.0; color: "#F9A825" }
        }

        // Sunrise
        Text {
            id: sunriseStatic
            anchors {
                left: parent.left
                leftMargin: parent.height * 0.05
                top: parent.top
                topMargin: parent.height * 0.05
            }
            text: qsTr("Sunrise:")
            font.pixelSize: parent.height * 0.15
        }
        Text {
            id: sunriseDetail
            anchors {
                top: sunriseStatic.bottom
                horizontalCenter: parent.horizontalCenter
            }
            text: sunrise
            font.pixelSize: parent.height * 0.2
        }

        // Sunset
        Text {
            id: sunsetStatic
            anchors {
                left: parent.left
                leftMargin: parent.height * 0.05
                top: sunriseDetail.bottom
            }
            text: qsTr("Sunset:")
            font.pixelSize: parent.height * 0.15
        }
        Text {
            id: sunsetDetail
            anchors {
                top: sunsetStatic.bottom
                horizontalCenter: parent.horizontalCenter
            }
            text: sunset
            font.pixelSize: parent.height * 0.2
        }
    }

    Rectangle {
        id: backButton
        anchors {
            left: parent.left
            bottom: parent.bottom
            margins: parent.height * 0.02
        }
        height: parent.height * 0.12
        width: height
        color: "black"

        Text {
            anchors.centerIn: parent
            text: "<-"
            font.pixelSize: parent.height * 0.5
            color: "#FDD835"
        }

        // Emit back signal when user clicks
        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.back()
            }
        }
    }

    function parseJSON(data) {
        var obj = JSON.parse(data)
        if (typeof(obj) == 'object') {
            if (obj.hasOwnProperty('query')) {
                var ch = obj.query.results.channel

                // Get location
                city = ch.location["city"]
                country = ch.location["country"]
                region = ch.location["region"]

                // Get condition
                var item = ch.item
                dateTitle.text = item.condition["date"]
                weatherState.source = "images/" + item.condition["code"] + ".png"
                weatherDescription.text = item.condition["text"]
                temperature.text = item.condition["temp"] + "°F - "

                // Get wind
                chill = ch.wind["chill"]
                direction = ch.wind["direction"]
                speed = ch.wind["speed"]

                // Get atmosphere
                humidity = ch.atmosphere["humidity"]
                pressure = ch.atmosphere["pressure"]
                rising = ch.atmosphere["rising"]
                visibility = ch.atmosphere["visibility"]

                // Get astronomy
                sunrise = ch.astronomy["sunrise"]
                sunset = ch.astronomy["sunset"]
            }
        }
    }

    function init() {
        var res
        var url = 'https://query.yahooapis.com/v1/public/yql?q=select * from weather.forecast where woeid in (select woeid from geo.places(1) where text="' + searchFor + '")' + '&format=json'
        var doc = new XMLHttpRequest()
        doc.onreadystatechange = function() {
            if (doc.readyState == XMLHttpRequest.DONE) {
                res = doc.responseText
                parseJSON(res)
            }
        }
        doc.open('GET', url, true)
        doc.send()
    }
}
