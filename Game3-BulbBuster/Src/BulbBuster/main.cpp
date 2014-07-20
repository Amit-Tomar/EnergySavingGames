#include <QDeclarativeContext>
#include <QApplication>
#include "qmlapplicationviewer.h"
#include "BowRowSettings.h"
#include <QUrl>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    viewer.addImportPath(QLatin1String("modules"));
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);

    BowRowSettings objBowRowSettings;
    viewer.rootContext()->setContextProperty  ("bowRowController", &objBowRowSettings);

    viewer.setWindowFlags(Qt::FramelessWindowHint);
    viewer.setSource(QUrl(("qrc:/qml/BulbBuster/main.qml")));
    viewer.showExpanded();

    return app->exec();
}
