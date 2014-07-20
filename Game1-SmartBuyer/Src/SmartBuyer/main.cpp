#include <QApplication>
#include <QDeclarativeContext>
#include "qmlapplicationviewer.h"
#include <QUrl>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    viewer.addImportPath(QLatin1String("modules"));
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.rootContext()->setContextProperty("installPath", "file://" + QCoreApplication::applicationDirPath() + "/");
    viewer.setSource(QUrl(("qrc:/qml/SmartBuyer/main.qml")));
    viewer.showExpanded();

    return app->exec();
}
