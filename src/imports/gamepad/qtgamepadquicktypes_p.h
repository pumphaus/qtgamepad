/****************************************************************************
**
** Copyright (C) 2023 Arno Rehn <arno@arnorehn.de>.
**
** This file is part of the Qt Gamepad Legacy module
**
** $QT_BEGIN_LICENSE:LGPL3$
**
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef QTGAMEPADQUICKTYPES_P_H
#define QTGAMEPADQUICKTYPES_P_H

//
//  W A R N I N G
//  -------------
//
// This file is not part of the Qt API.  It exists purely as an
// implementation detail.  This header file may change from version to
// version without notice, or even be removed.
//
// We mean it.
//

#include <QtQml/qqml.h>
#include "qgamepad.h"
#include "qgamepadkeynavigation.h"
#include "qgamepadmanager.h"
#include "qgamepadmouseitem.h"
#include "qjsengine.h"

QT_BEGIN_NAMESPACE

struct QGamepadManagerForeign
{
    Q_GADGET
    QML_SINGLETON
    QML_FOREIGN(QGamepadManager)
    QML_NAMED_ELEMENT(GamepadManager)
public:
    static QGamepadManager *create(QQmlEngine *, QJSEngine *engine)
    {
        auto *inst = QGamepadManager::instance();
        Q_ASSERT(inst->thread() == engine->thread());
        QJSEngine::setObjectOwnership(inst, QJSEngine::CppOwnership);
        return inst;
    }
};

struct QGamepadForeign
{
    Q_GADGET
    QML_FOREIGN(QGamepad)
    QML_NAMED_ELEMENT(Gamepad)
};

struct QGamepadKeyNavigationForeign
{
    Q_GADGET
    QML_FOREIGN(QGamepadKeyNavigation)
    QML_NAMED_ELEMENT(GamepadKeyNavigation)
};

struct QGamepadMouseItemForeign
{
    Q_GADGET
    QML_FOREIGN(QGamepadMouseItem)
    QML_NAMED_ELEMENT(GamepadMouseItem)
};

QT_END_NAMESPACE

#endif
