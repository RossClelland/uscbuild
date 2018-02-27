// Copyright (c) 2011-2014 The Uscoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef USCOIN_QT_USCOINADDRESSVALIDATOR_H
#define USCOIN_QT_USCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class UscoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit UscoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Uscoin address widget validator, checks for a valid uscoin address.
 */
class UscoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit UscoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // USCOIN_QT_USCOINADDRESSVALIDATOR_H
