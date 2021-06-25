Post.destroy_all
User.destroy_all
Category.destroy_all
PostIngredient.destroy_all
# Ingredient.destroy_all

puts "Destroyed everything you touch"

user = User.create!(email: 'admin@gmail.com', password: '123456', role: 'admin')

categories = %w[Закуски Завтраки Салаты Супы Основные\ блюда]

categories.each do |category|
	Category.create!(name: category)
end

ingredients = %w[
  Помидоры-черри Сыр\ «Фета» Салат\ Микс Масло\ оливковое Специи 5\ крупных\ редисок 3\ больших\ куска\ черного\ хлеба\ с\ семечками Сливочное\ масло Авокадо Шпинат
  Томатный\ соус Сыр\ «Маасдам» Тесто\ для\ пиццы Бекон Мука/подсолнечное\ масло Индейка
  Сельдерей Кабачки Орехи\ кешью Соус\ терияки
]

ingredients.each do |i|
  Ingredient.create!(ingredient: i)
end

posts = [
{
	name: "Овощной салат с фетой",
	title: "Легкий и быстрый рецепт",
	content:"Разрезать помидоры пополам, нарезать сыр «Фета» на небольшие кубики. Салат помыть и обсушить, добавить сливочное масло и специи. Перемешать все ингредиенты, приятного аппетита!" "&nbsp;".html_safe,
  image: File.open(Rails.root.join('public', 'images', 'dsh-salad-vegetables.png')),
	time: "15 мин",
	category_id: Category.pluck(:id)[2],
  user_id: user.id,
	complexity: "easy",
	number_of_servings: 4
	# ingredients: "
	# Помидоры-черри — 150 г;
	# Сыр «Фета» — 60 г;
	# Салат Микс — 200 г;
	# Масло оливковое — 20 г;
	# Специи — 10 г"
},
{
	name: "Брускетта с редисом и авокадо",
	title: "Легкая закуска",
	content: "Порезать хлеб на куски толщиной 1–2 см и выложить в любую форму для выпечки или на противень, застеленный бумагой для выпечки. Каждый кусок совсем чуть-чуть помазать сливочным маслом. Убрать хлеб в духовку, разогретую на 180°C на минут 5–10 минут до появления корочки. Во время выпекания можно порезать авокадо на небольшие полукруги и нарезать редис на круги толщиной в 3–5 мм. Достать из духовки и оставить до полного остывания. Намазать оставшееся сливочное масло на хлеб. Добавить авокадо, редис и посыпать сверху шпинатом",
  image: File.open(Rails.root.join('public', 'images', 'dsh-snack-bruschetta.png')),
	time: "10 мин",
	category_id: Category.pluck(:id)[0],
  user_id: user.id,
	complexity: "easy",
	number_of_servings: 4
	# ingredients: "5 крупных редисок;
	# 3 больших куска черного хлеба с семечками;
	# Сливочное маслом — 100 г;
	# Авокадо — 200 г;
	# Шпинат — 100 г"
},
{
	name: "Пицца с беконом",
	title: "Быстро и вкусно",
	content: "Взять готовое тесто для пиццы, полить или посыпать противень мукой или подсолнечным маслом. Раскатать тесто, намазать томатным соусом, оставив зазор в 1.5–2 см. Выложить ломтики бекона. Порезать лук на тонкие кругы, сверху положить натертый сыр. Поставить выпекаться на 180°C в течение 25 минут.",
  image: File.open(Rails.root.join('public', 'images', 'dsh-pizza.png')),
	time: "30 мин",
	category_id: Category.pluck(:id)[4],
  user_id: user.id,
	complexity: "easy",
	number_of_servings: 4
	# ingredients: "
	# Томатный соус — 100 г;
	# Сыр «Маасдам» — 150 г;
	# Тесто для пиццы —  400 г;
	# Бекон — 250 г;
	# Мука/подсолнечное масло — 50 г/50 мл;"
},


{
	name: "Индейка в соусе терияки",
	title: "Сытное горячее блюдо для холодных осенних дней",
	content: "Нарезать филе индейки небольшими кусочками. Хорошо разогреть сковородку с оливковым маслом. Кусочки индейки выложить в сковороду, перемешать, чтобы немного «схватились» корочкой. Затем огонь чуть уменьшить. Далее добавить в сковороду с индейкой нарезанные полукольцами лук и болгарский перец, выдавить чеснок и влить соус терияки (можно заменить на соевый, но вкус будет отличаться). Готовить минут 20. После добавить в сковороду мед, и когда он «расплавится», всыпать кунжутные семечки, перемешать.",
  image: File.open(Rails.root.join('public', 'images', 'dsh-second-ragout.png')),
	time: "35 мин",
	category_id: Category.pluck(:id)[4],
  user_id: user.id,
	complexity: "easy",
	number_of_servings: 4
	# ingredients: "
	# Индейка — 200 г;
	# Сельдерей — 1 шт;
	# Кабачки — 1 шт;
	# Орехи кешью — 50 г;
	# Соус терияки — 100 мл;"
}
]

posts.each do |post|
	postik = Post.create!(post)
	puts "Some magic just create a #{ postik.name } with id #{ postik.id }!"
end

food_categories = [
	{
		name: "omnivores",
	},
	{
		name: 'vegetarians',
	},
	{
		name: 'pescetarians',
	},
	{
		name: 'vegans'
	}
]

food_categories.each do |food_category|
	FoodCategory.create!(food_category)
end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Post.create!(name: 'Индейка в соусе терияки', title: "Сытное горячее блюдо для холодных осенних дней", content: "Нарезать филе индейки небольшими кусочками. Хорошо разогреть сковородку с оливковым маслом. Кусочки индейки выложить в сковороду, перемешать, чтобы немного \«схватились\» корочкой. Затем огонь чуть уменьшить. Далее добавить в сковороду с индейкой нарезанные полукольцами лук и болгарский перец, выдавить чеснок и влить соус терияки (можно заменить на соевый, но вкус будет отличаться). Готовить минут 20. После добавить в сковороду мед, и когда он «расплавится», всыпать кунжутные семечки, перемешать.", user_id: 10, category_id: 40, post_ingredients_attributes: [{ amount: 200, measure: 'г' }, { amount: 1, measure: 'шт' }], ingredients_attributes: [{ingredient: 'Индейка' }, {ingredient: 'Сельдерей'}] )
