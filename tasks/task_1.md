# **Z-Wave Command Classes**

## **User Code Command Class**
> **User Code Set Command**
```js
// [cmd_class, cmd_id, usr_id, usr_status, usr_code_1,.., usr_code_n]
// lets set the code as "2001"
[0x63, 0x01, 0x01, 0x00, 0x32, 0x30, 0x30, 0x31]
```

> **User Code Get Command**
```js
// [cmd_class, cmd_id, usr_id]
[0x63, 0x02, 0x01]
```

> **User Code Report Command**
```js
// Same as set command
// [cmd_class, cmd_id, usr_id, usr_status, usr_code_1,.., usr_code_n]
[0x63, 0x03, 0x01, 0x00, 0x32, 0x30, 0x30, 0x31]
```

## **Thermostat Setpoint Command Class**
> **Thermostat Setpoint Set Command**
```js
// [cmd_class, cmd_id, setpoint_type, prec/scale/size, value_1,.., value_n]
// lets set the temperature as 16.04*C (cooling)
// prec/scale/size = 2 dec_places/celcius/2 bytes = 010/01/100 = 0x4C
// 1604 = 0000 0110 0100 0100 = 0x06 0x44
[0x43, 0x01, 0x02, 0x01, 0x4C, 0x06, 0x44]
```
> **Thermostat Setpoint Get Command**
```js
// [cmd_class, cmd_id, setpoint_type]
[0x43, 0x02, 0x02]
```
> **Thermostat Setpoint Report Command**
```js
// Same as set command
// [cmd_class, cmd_id, setpoint_type, prec/scale/size, value_1,.., value_n]
[0x43, 0x03, 0x02, 0x01, 0x4C, 0x06, 0x44]
```

## **Climate Control Schedule Command Class**
> **Schedule Set Command**
```js
// [cmd_class, cmd_id, weekday, switchpoint0, switchpoint0, switchpoint0]
// lets set the schedule as wednesday 12 noon to have a setback of .5*C
[0x46, 0x01, 0x03, 0x0C, 0x00, 0x05]
```
> **Schedule Get Command**
```js
// [cmd_class, cmd_id, setpoint_type]
[0x46, 0x02, 0x03]
```

> **Schedule Report Command**
```js
// Same as set command
// [cmd_class, cmd_id, weekday, switchpoint0, switchpoint0, switchpoint0]
[0x46, 0x03, 0x03, 0x0C, 0x00, 0x05]
```