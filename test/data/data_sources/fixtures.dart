final List<String> persistedAccountsFixture = [
  """
{
  "id": 15,
	"name": "Account Name",
	"type": 1,
	"currency": {
		"code": "RUB",
		"symbol": "₽"
	},
	"isArchived": false,
	"isDeleted": false
}
"""
];

final List<String> persistedOperationsFixture = [
  """
{
	"id": 112,
	"type": 0,
	"createdTs": 1634239069458,
	"comment": "salary",
	"atomics": [
		{
			"id": 113,
			"money": {
				"coins": 1002
			},
			"type": 0,
			"account": {
				"id": 15,
				"name": "Account Name",
				"type": 1,
				"currency": {
					"code": "RUB",
					"symbol": "₽"
				},
				"isArchived": false,
      	"isDeleted": false
			}
		}
	]
}
"""
];
