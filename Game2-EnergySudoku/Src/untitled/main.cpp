#include <QApplication>
#include "qmlapplicationviewer.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    viewer.addImportPath(QLatin1String("modules"));
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setSource(QUrl(("qrc:/qml/untitled/main.qml")));
    viewer.setWindowFlags(Qt::FramelessWindowHint);
    viewer.showExpanded();

    return app->exec();
}
