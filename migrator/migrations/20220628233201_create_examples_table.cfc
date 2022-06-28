component extends="wheels.migrator.Migration" hint="create examples table" {

	function up() {
		transaction {
			try {
				t = createTable(name = 'examples');
				t.string(columnNames='name', default='', null=false, limit='255');
				t.string(columnNames='type', default='', null=true, limit='255');
				t.timestamps();
				t.create();
			} catch (any e) {
				local.exception = e;
			}

			if (StructKeyExists(local, "exception")) {
				transaction action="rollback";
				Throw(errorCode = "1", detail = local.exception.detail, message = local.exception.message, type = "any");
			} else {
				transaction action="commit";
			}
		}
	}

	function down() {
		transaction {
			try {
				dropTable('examples');
			} catch (any e) {
				local.exception = e;
			}

			if (StructKeyExists(local, "exception")) {
				transaction action="rollback";
				Throw(errorCode = "1", detail = local.exception.detail, message = local.exception.message, type = "any");
			} else {
				transaction action="commit";
			}
		}
	}

}
