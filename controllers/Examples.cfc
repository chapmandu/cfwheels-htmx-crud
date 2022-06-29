component extends="Controller" output=false {

	public void function config() {
		super.config();
		filters(through = "findOne", only = "show,edit,update,delete");
	}

	// FILTERS

	private any function findOne() {
		example = model("Example").findByKey(params.key);
		if (!IsObject(example)) {
			flashInsert(message = "Example #params.key# was not found", messageType = "error");
			return redirectTo(route = "Examples");
		}
	}

	// PARTIAL DATA FUNCTIONS

	private struct function fields() {
		options = ["Hard", "Green", "Soft", "Orange", "Squishy", "Purple"];
		return {};
	}

	private struct function list() {
		examples = model("Example").findAll();
		return {};
	}

	// CRUD

	public void function index() {
		writeDump(var="here", label="here");
	}

	public void function show() {
	}

	public void function new() {
		example = model("Example").new();
	}

	public any function create() {
		example = model("Example").new(params.example);
		if (example.save()) {
			cfheader(name = "HX-Push", value = URLFor(route = "Example", key = example.key()));
			flashInsert(message = "The example has been saved.", messageType = "success");
			return renderView(action = "show");
		} else {
			flashInsert(message = "There was a problem creating the example.", messageType = "error");
			return renderView(action = "new");
		}
	}

	public void function edit() {
	}

	public any function update() {
		if (example.update(params.example)) {
			flashInsert(message = "The example has been saved.", messageType = "success");
			return renderView(action = "show");
		} else {
			flashInsert(message = "There was a problem updating this Example.", messageType = "error");
			return renderView(action = "edit");
		}
	}

	public any function delete() {
		if (!example.delete()) {
			flashInsert(message = "There was a problem deleting this Example.", messageType = "error");
		}
		return renderView(action = "index");
	}

}
