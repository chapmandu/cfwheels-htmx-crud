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
	}

	public void function show() {
	}

	public void function new() {
		example = model("Example").new();
	}

	public any function create() {
		example = model("Example").new(params.example);
		if (example.save()) {
			return this.respond(
				message = "#example.name# has been saved.", messageType = "success",
				push = {route = "Example", key = example.key()},
				action = "show"
			);
		} else {
			return this.respond(message = "There was a problem creating the example.", messageType = "error", action = "new");
		}
	}

	public void function edit() {
	}

	public any function update() {
		if (example.update(params.example)) {
			return this.respond(
				message = "#example.name# has been saved.", messageType = "success",
				push = {route = "Example", key = example.key()},
				action = "show"
			);
		} else {
			return this.respond(message = "There was a problem updating #example.name#.", messageType = "error", action = "edit");
		}
	}

	public any function delete() {
		if (example.delete()) {
			this.respond(
				message = "#example.name# has been deleted.", messageType = "error",
				action = "index",
				push = {route = "Examples"}
			);
		} else {
			this.respond(message = "There was a problem deleting this example.", messageType = "error", action = "index");
		}
	}

	// PRIVATE

	/**
	 * Responds to a HTMX request.. experimental!
	 */
	private any function respond(
		string action = "",
		string message = "",
		string messageType = "success",
		struct push = {},
		struct redirect = {} // TODO
	) {
		if (Len(arguments.message)) {
			flashInsert(message = arguments.message, messageType = arguments.messageType);
		}
		if (!StructIsEmpty(arguments.push)) {
			cfheader(name = "HX-Push", value = URLFor(argumentCollection = arguments.push));
		}
		if (Len(arguments.action)) {
			return renderView(action = arguments.action);
		}
	}

}
