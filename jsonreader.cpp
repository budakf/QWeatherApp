#include "jsonreader.h"

JsonReader::JsonReader(QString pFileName, QObject *parent) : QObject(parent)
{
    QFile *file = new QFile(pFileName);
    QString value;
    if( file->open(QFile::ReadOnly) )
        value = file->readAll();

    QJsonDocument document =  QJsonDocument::fromJson(value.toUtf8());
    this->mJsonArray = document.array();

    QJsonObject tempObject;
    QFile * file2 = new QFile("/Users/budakf/Qt_Projects/QWeatherApp/a.txt");
    if(file2->open(QIODevice::WriteOnly)) qDebug()<<"Opening";
    file2->write("[");
    for(auto i : mJsonArray){
        tempObject = i.toObject();
        //qDebug()<<tempObject["name"].toString();
        file2->write("\"");
        file2->write(tempObject["name"].toString().toUtf8());
        file2->write("\", ");
        this->mCityList.push_back(tempObject["name"].toString());
    }
    file2->write("]");


    file->close();

}


QVariantList& JsonReader::getCityList(){
    return this->mCityList;
}
