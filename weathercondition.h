#ifndef WEATHERCONDITION_H
#define WEATHERCONDITION_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrlQuery>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>


class WeatherCondition : public QObject
{
    Q_OBJECT
public:
    explicit WeatherCondition(QObject *parent = nullptr) : QObject(parent){ }
    WeatherCondition(WeatherCondition &) = default;

    Q_INVOKABLE void setCity(QString pCity);
    Q_INVOKABLE void setLocation(QString pLongtitude, QString pLatitude);
    Q_INVOKABLE void takeWeatherForecastFromApiWithCityName();
    Q_INVOKABLE void takeWeatherForecastFromApiWithLocation();
    Q_INVOKABLE QVariantMap getData(){ return this->mData; }


private:
    QVariantMap mData;
    QString mAppid{"1f2143e9f618e398a1ff3702ad06e7e0"};

signals:
    void dataReady();

public slots:

};


#endif // WEATHER_H
