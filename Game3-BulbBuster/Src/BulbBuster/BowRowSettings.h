#ifndef BowRowSettings_H
#define BowRowSettings_H

#include <QObject>
#include <iostream>
#include <cstdio>

class BowRowSettings : public QObject
{
    Q_OBJECT
public:
    explicit BowRowSettings(QObject *parent = 0);
    Q_INVOKABLE void     play();
    Q_INVOKABLE void     storeHighestScore(QString,QString);
    Q_INVOKABLE int      getHighestScore();
    Q_INVOKABLE QString  getHighestScorer();
    Q_INVOKABLE void     setHighestScorerData(QString, QString);

private:

};

#endif // BowRowSettings_H
