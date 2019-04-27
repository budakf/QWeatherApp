#ifndef WEATHER_H
#define WEATHER_H

#include <QObject>

class weather : public QObject
{
    Q_OBJECT
public:
    explicit weather(QObject *parent = nullptr);

signals:

public slots:
};

#endif // WEATHER_H