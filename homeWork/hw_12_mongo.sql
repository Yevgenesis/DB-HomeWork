// 1. Создать коллекцию workers.
// 2. Заполнить коллекцию workers 5 документами со свойствами _id, firstname, lastname, age, position, salary, skills. Используйте следующие данные:

// 1. Inga Petrova, 27, Barista, 1500, [’preparing drinks’, ‘cleaning equipment’]
// 2. Boris Orlov, 36, Server, 2400, [’taking orders’, ‘suggesting meals’, ‘taking payments’]
// 3. Ivan Demidov, 32, Chef, 3200, [’preparing food’, ‘baking bread’]
// 4. Marina Sidorova, 22, Hostess, 1700, [’greeting guests’, ‘seating guests’, ‘answering phone calls’]
// 5. Olga Ivanova, 43, Sommelier, 2500, [’curating a wine list’, ‘creating wine pairings’]

use gr220823

db.workers2.insertMany([{
    _id: 1,
    firstname: "Inga",
    lastname: "Petrova",
    age: 27,
    position: "Barista",
    salary: 1500,
    skills: ["preparing drinks", "cleaning equipment"]
}, {
    _id: 2,
    firstname: "Boris",
    lastname: "Orlov",
    age: 36,
    position: "Server",
    salary: 2400,
    skills: ["taking orders", "suggesting meals", "taking payments"]
}, {
    _id: 3,
    firstname: "Ivan",
    lastname: "Demidov",
    age: 32,
    position: "Chef",
    salary: 3200,
    skills: ["preparing food", "baking bread"]
}, {
    _id: 4,
    firstname: "Marina",
    lastname: "Sidorova",
    age: 22,
    position: "Hostess",
    salary: 1700,
    skills: ["greeting guests", "seating guests", "answering phone calls"]
}, {
    _id: 5,
    firstname: "Olga",
    lastname: "Ivanova",
    age: 43,
    position: "Sommelier",
    salary: 2500,
    skills: ["curating a wine list", "creating wine pairings"]
}])


// Найти всех работников, чья зарплата больше 2000.

db.workers.find({salary: {$gte: 2000}})
db.workers.find({age: {$lt: 30}})
db.workers.find({position: {$in: ["Server", "Chef"]}})
db.workers.find({skills: "taking orders"})
db.workers.find({$not: [{skills: "taking orders"}]})
db.workers.find({skills: {$nin: ["baking bread"]}})

// Найти всех работников, чья зарплата больше 2000 и чьи навыки включают "greeting guests".

db.workers.find({salary: {$gt: 2000}, skills: "greeting guests"})

// Найти всех работников, чья зарплата меньше 3000 или возраст больше 40.

db.workers.find({
    $or: [
        {salary: {$lt: 3000}},
        {age: {$gt: 40}}
    ]
})

//  Найти всех работников, чья зарплата меньше 3000 или возраст больше 40. Вывести только имя и фамилию
db.workers.find(
    {$or: [{salary: {$lt: 3000}}, {age: {$gt: 40}}]},
    {firstname: 1, lastname: 1, _id: 0}
    )

//Найти всех работников, чья зарплата меньше 3000 или возраст больше 40. Вывести все поля, кроме зарплаты
db.workers.find(
    {$or: [{salary: {$lt: 3000}}, {age: {$gt: 40}}]},
    {salary: 0}
    )


//Вывести первого сотрудника
db.workers.find().limit(1)

// Вывести всех пропуская первых двух сотрудников
db.workers.find().skip(2)

//Вывести двух сотрудников пропуская первого сотрудника
db.workers.find().skip(1).limit(2)

// Сортировка
db.workers.find().sort({поле: 1}) // (по возрс.)
db.workers.find().sort({поле: -1}) // (по убыв.)

db.workers.find().skip(2).limit(3)

// Пагинация массива
// slice = skip + limit для массива

$slice: limit
$slice: [skip, limit]

// Вывести только первый навык сотрудника Марина
db.workers.find({firstname: 'Marina'}, {skills: {$slice: 1}})

db.workers.find({firstname: 'Marina'}, {skills: {$slice: [1,]}})
db.workers.find({firstname: 'Marina'}, {skills: {$slice: -1}})

db.workers.find({firstname: 'Marina'}, {skills: {$slice: [1,]}})


db.workers.aggregate([
    {$match: {firstname: 'Marina'}}, // Находим все документы с именем Marina
    {
        $project: {
            _id: 1,
            firstname: 1,
            lastname: 1,
            age: 1,
            position: 1,
            salary: 1,
            skills: {$slice: ['$skills', 1, {$size: '$skills'}]}
        }
    } // Исключаем первый элемент из массива skills
])


db.workers.find({firstname: 'Boris'}, {skills: 1})

db.workers2.find({firstname: 'Boris'},
    {
        _id: 0,
        firstname: 0,
        lastname: 0,
        position: 0,
        salary:0,
        age:0,
        skills: {$slice: 1}
    })

db.workers.find({ firstname: 'Boris' }, {
    skills: { $slice: 1 }
})
