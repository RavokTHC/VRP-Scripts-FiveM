
local cfg = {}

-- paycheck and bill for users
cfg.message_paycheck = "Você recebeu seu salario: ~g~$" -- message that will show before payment of salary
cfg.message_bill = "Pagamento de contas: ~r~$" -- message that will show before payment of bill
cfg.post = "." -- message that will show after payment

cfg.bank = true -- if true money goes to bank, false goes to wallet

cfg.minutes_paycheck = 30 -- minutes between payment for paycheck
cfg.minutes_bill = 30 -- minutes between withdrawal for bill

cfg.paycheck_title_picture = "Banco do Brasil" -- define title for paycheck notification picture
cfg.paycheck_picture = "CHAR_BANK_MAZE" -- define paycheck notification picture want's to display
cfg.bill_title_picture = "Compania de Seguro" -- define title for bill notification picture
cfg.bill_picture = "CHAR_MP_MORS_MUTUAL" -- define bill notification picture want's to display

cfg.paycheck = { -- ["permission"] = paycheck
  ["coronel.paycheck"] = 20000,
  ["policiafederal.paycheck"] = 15000,
  ["rota.paycheck"] = 10000,
  ["aguia.paycheck"] = 6000,
  ["pm.paycheck"] = 2300,
--[""] = 0,
  ["emergency.paycheck"] = 3000,
  ["taxi.paycheck"] = 800,
  ["repair.paycheck"] = 800,
  ["bankdriver.paycheck"] = 1200,
  ["diretorchefe.paycheck"] = 15000,
  ["delivery.paycheck"] = 500
}

cfg.bill = { -- ["permission"] = withdrawal
  ["coronel.paycheck"] = 3000,
  ["policiafederal.paycheck"] = 2500,
  ["rota.paycheck"] = 2000,
  ["aguia.paycheck"] = 1000,
  ["pm.paycheck"] = 450,
--[""] = 0,
  ["emergency.paycheck"] = 150,
  ["taxi.paycheck"] = 125,
  ["repair.paycheck"] = 100,
  ["bankdriver.paycheck"] = 220,
  ["diretorchefe.paycheck"] = 2500,
  ["delivery.paycheck"] = 350
}

return cfg

