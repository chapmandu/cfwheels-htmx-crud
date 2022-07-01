component extends="Controller" output=false {

	public void function config() {
		super.config();
		filters(through = "setup");
		filters(through = "findOne", only = "show,edit,update,delete");
	}

	// FILTERS

	private void function setup() {
		flashTypes = ["info", "ok", "warn", "bad"];
	}

	private any function findOne() {
		example = model("Example").findByKey(params.key);
		if (!IsObject(example)) {
			flashInsert(bad = "Example #params.key# was not found");
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
				ok = "#example.name# has been saved.",
				push = {route = "Example", key = example.key()},
				action = "show"
			);
		} else {
			return this.respond(warn = "There was a problem creating the example.", action = "new");
		}
	}

	public void function edit() {
	}

	public any function update() {
		if (example.update(params.example)) {
			return this.respond(
				ok = "#example.name# has been saved.",
				push = {route = "Example", key = example.key()},
				action = "show"
			);
		} else {
			return this.respond(warn = "There was a problem updating #example.name#.", action = "edit");
		}
	}

	public any function delete() {
		if (example.delete()) {
			this.respond(
				ok = "#example.name# has been deleted.",
				action = "index",
				push = {route = "Examples"}
			);
		} else {
			this.respond(bad = "There was a problem deleting this example.", action = "index");
		}
	}

	// PRIVATE

	/**
	 * Responds to a HTMX request.. experimental!
	 */
	private any function respond(
		string action = "",
		struct push = {},
		struct redirect = {} // TODO
	) {
		for (local.flashType in flashTypes) {
			if (StructKeyExists(arguments, local.flashType)) {
				flashInsert("#local.flashType#" = arguments[local.flashType]);
			}
		}
		if (!StructIsEmpty(arguments.push)) {
			cfheader(name = "HX-Push", value = URLFor(argumentCollection = arguments.push));
		}
		if (Len(arguments.action)) {
			return renderView(action = arguments.action);
		}
	}

}
