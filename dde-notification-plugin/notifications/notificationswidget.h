/*
 * Copyright (C) 2011 ~ 2018 Deepin Technology Co., Ltd.
 *
 * Author:     sbw <sbw@sbw.so>
 *
 * Maintainer: sbw <sbw@sbw.so>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef NOTIFICATIONSWIDGET_H
#define NOTIFICATIONSWIDGET_H

#include "constants.h"

#include <QWidget>
#include <QIcon>

class NotificationsWidget: public QWidget
{
    Q_OBJECT

public:
    explicit NotificationsWidget(QWidget *parent = nullptr);
    void setDisturb(bool OK);

protected:
    void paintEvent(QPaintEvent *e) override;

private:
    void resizeEvent(QResizeEvent *event) override;
    void mousePressEvent(QMouseEvent *event) override;
    void mouseReleaseEvent(QMouseEvent *event) override;
    void mouseMoveEvent(QMouseEvent *event) override;
    void leaveEvent(QEvent *event) override;
    const QPixmap loadSvg(const QString &iconName, const QString &localPath, const int size, const qreal ratio);
    bool containCursorPos();

private:
    bool m_disturb; //提供勿扰图标修改
    bool m_hover;
    bool m_pressed;
};

#endif // NOTIFICATIONSWIDGET_H
