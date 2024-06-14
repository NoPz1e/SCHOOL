1. **Funções de Texto**
- CONCAT(string1, string2, ...)
- SUBSTRING(string, start, length)
- UPPER(string)
- LOWER(string)
- TRIM(string)
2. **Funções de Matemática**
- ABS(number)
- CEIL(number)
- FLOOR(number)
- ROUND(number, decimals)
- POW(base, exponent)
3. **Funções de Data e Hora**
- NOW()
- CURDATE()
- CURTIME()
- DATE_ADD(date, INTERVAL value unit)
- DATEDIFF(date1, date2)
4. **Funções de Agregação**
- COUNT(column)
- SUM(column)
- AVG(column)
- MAX(column)
- MIN(column)
5. **Funções de Controle de Fluxo**
- IF(condition, true_value, false_value)
- CASE
6. **Funções de Cadeia de Caracteres**
- REPLACE(string, from_string, to_string)
- LEFT(string, length)
- RIGHT(string, length)
7. **Funções de Criptografia e Segurança**
- MD5(string)
- SHA1(string)
- PASSWORD(string)
8. **Funções de Informação**
- DATABASE()
- USER()
- VERSION()
- LAST_INSERT_ID()
9. **Funções de Formatação de Dados**
- FORMAT(number, decimals)
- CONVERT(value, type)
- CAST(value AS type)
10. **Funções JSON**
- JSON_OBJECT(key, value)
- JSON_ARRAY(value1, value2, ...)
- JSON_EXTRACT(json_doc, path)
- JSON_SET(json_doc, path, value)
11. **Funções de Agrupamento**
- GROUP_CONCAT(expression)
12. **Funções de Bitwise**
- BIT_AND(column)
- BIT_OR(column)
- BIT_XOR(column)
13. **Funções de Comparação**
- GREATEST(value1, value2, ...)
- LEAST(value1, value2, ...)
14. **Funções de Codificação**
- ENCODE(string, password)
- DECODE(string, password)
15. **Funções de Encriptação**
- AES_ENCRYPT(string, key)
- AES_DECRYPT(crypt_string, key)
16. **Funções Espaciais**
- ST_AREA(geometry)
- ST_DISTANCE(geom1, geom2)
17. **Funções de Controle de Erro**
- IFNULL(expression, alt_value)
- NULLIF(expression1, expression2)
18. **Funções de Sistema**
- BENCHMARK(count, expression)
- SLEEP(seconds)
19. **Funções de Conversão**
- BIN(number)
- HEX(number)
- OCT(number)
20. **Funções de Utilitário**
- UUID()
- UUID_SHORT()