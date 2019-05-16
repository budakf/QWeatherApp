#include "weathercondition.h"

void WeatherCondition::setCity(QString pCity) {
    mData["city"] = pCity;
}

void WeatherCondition::setLocation(QString pLongtitude, QString pLatitude){

}

void WeatherCondition::takeWeatherForecastFromApiWithCityName(){
    QUrl url{"https://api.openweathermap.org/data/2.5/weather"};

    QUrlQuery query;
    query.addQueryItem("q", this->mData["city"].toString());
    query.addQueryItem("appid", this->mAppid);
    query.addQueryItem("units", "metric");

    url.setQuery(query);

    QNetworkRequest request{url};

    QNetworkAccessManager * networkAccessManager = new QNetworkAccessManager(this);

    connect(networkAccessManager, &QNetworkAccessManager::finished, [&](QNetworkReply * reply){
        finished(reply);
    });

    networkAccessManager->get(request);
}

void WeatherCondition::finished(QNetworkReply * reply){

    if(reply->error() == QNetworkReply::NoError){
        QByteArray result = reply->readAll();
        QJsonDocument jsonResponse = QJsonDocument::fromJson(result);
        QJsonObject obj = jsonResponse.object();
        QString city = mData["city"].toString();
        QJsonObject main =  obj["main"].toObject();
        this->mData[city+"_currentTemperature"] = QString::number( (int) main["temp"].toDouble() );
        this->mData[city+"_minTemperature"] = QString::number( (int) main["temp_min"].toDouble() );
        this->mData[city+"_maxTemperature"] = QString::number( (int) main["temp_max"].toDouble() );

        QJsonArray weatherArray = obj["weather"].toArray();
        QJsonObject weather = weatherArray.at(0).toObject();
        this->mData[city+"_weatherDetails"] = weather["description"].toString();

        if(mData.size() == 5){
            emit firstDataReady();
            qDebug()<<"First Data";
        }

        else if(mData.size() == 9){
            emit secondDataReady();
            qDebug()<<"Second Data";
        }

        else {
            emit thirdDataReady();
            qDebug()<<"Third Data";
        }

        qDebug()<<mData.size();
    }

    else{
        qDebug()<<"Error";
    }
}

void WeatherCondition::clearData(){
    this->mData.clear();
}

void WeatherCondition::takeWeatherForecastFromApiWithLocation(){


}
