/*
 * Copyright (C) by Roeland Jago Douma <roeland@famdouma.nl>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * for more details.
 */

#include "legalnotice.h"
#include "ui_legalnotice.h"

namespace OCC {


LegalNotice::LegalNotice(QDialog *parent)
    : QDialog(parent)
    , _ui(new Ui::LegalNotice)
{
    _ui->setupUi(this);

    QString notice = tr("<p>oneLTA AG<br />"
                        "</p>");

    notice += tr("<p>Refer Terms of Usage and Privacy Policy at join.onelta.com.</p>");

    _ui->notice->setTextInteractionFlags(Qt::TextSelectableByMouse | Qt::TextBrowserInteraction);
    _ui->notice->setText(notice);
    _ui->notice->setWordWrap(true);

    connect(_ui->closeButton, &QPushButton::clicked, this, &LegalNotice::accept);
}

LegalNotice::~LegalNotice()
{
    delete _ui;
}

}
