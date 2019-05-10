#ifndef JSONREADER_H
#define JSONREADER_H

#include <QFile>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonDocument>
#include <QDebug>
#include <QVariantList>

class JsonReader : public QObject
{
    Q_OBJECT

public:
    JsonReader(QString, QObject *parent = nullptr);
    Q_INVOKABLE QVariantList& getCityList();


private:
    QJsonArray mJsonArray;
    QVariantList mCityList;
};



#endif // JSONREADER_H
