component extends="Controller" output=false {

	variables.flashTypes = ["info", "ok", "warn", "bad"];

	public void function config() {
		super.config();
	}

	// PARTIAL DATA FUNCTIONS

	private struct function fields() {
		return {
			"options" = ["Hard", "Green", "Soft", "Orange", "Squishy", "Purple"]
		};
	}

	// CRUD

	public void function index() {
		examples = model("Example").findAll();
		if (request.isHTMX) {
			return renderView(layout = false);
		}
	}

	public void function show() {
		example = model("Example").findByKey(params.key);
		if (request.isHTMX) {
			return renderView(layout = false);
		}
	}

	public void function new() {
		example = model("Example").new();
		if (request.isHTMX) {
			return renderView(layout = false);
		}
	}

	public any function create() {
		example = model("Example").new(params.example);
		if (example.save()) {
			flashInsert(ok = "#example.name# has been saved.");
			cfheader(name = "HX-Push", value = URLFor(route = "Example", key = example.key()));
			return renderView(action = "show", layout = false);
		} else {
			flashInsert(warn = "There was a problem creating the example.");
			return renderView(action = "new", layout = false);
		}
	}

	public void function edit() {
		example = model("Example").findByKey(params.key);
		if (request.isHTMX) {
			return renderView(layout = false);
		}
	}

	public any function update() {
		example = model("Example").findByKey(params.key);
		if (example.update(params.example)) {
			flashInsert(ok = "#example.name# has been saved.");
			cfheader(name = "HX-Push", value = URLFor(route = "Example", key = example.key()));
			return renderView(action = "show", layout = false);
		} else {
			flashInsert(warn = "There was a problem updating #example.name#.");
			return renderView(action = "edit", layout = false);
		}
	}

	public any function delete() {
		example = model("Example").findByKey(params.key);
		if (example.delete()) {
			flashInsert(ok = "#example.name# has been deleted.");
		} else {
			flashInsert(bad = "There was a problem deleting this example.");
		}
		examples = model("Example").findAll();
		cfheader(name = "HX-Push", value = URLFor(route = "Examples"));
		return renderView(action = "index", layout = false);
	}

}
