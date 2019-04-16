CREATE TABLE milestones (
	workspace_id uuid NOT NULL,
	project_id uuid NOT NULL,
	id uuid NOT NULL,	
	rank varchar not null,	
	title varchar NOT NULL,	
	"description" varchar not null,	
	status varchar not null,	
	created_by uuid,
	created_by_name varchar NOT NULL,	
	created_at TIMESTAMP WITH TIME ZONE not null,			
	last_modified TIMESTAMP WITH TIME ZONE not null,			
	last_modified_by_name varchar not null,			
	CONSTRAINT "PK_milestones" PRIMARY KEY (workspace_id,id),	
	CONSTRAINT "UN_milestones_1" UNIQUE (workspace_id,project_id, rank),	
	CONSTRAINT "FK_milestones_1" FOREIGN KEY (workspace_id) REFERENCES workspaces(id) ON DELETE CASCADE,
	CONSTRAINT "FK_milestones_2" FOREIGN KEY (workspace_id, project_id) REFERENCES projects(workspace_id, id) ON DELETE CASCADE,
	CONSTRAINT "FK_milestones_3" FOREIGN KEY (workspace_id,created_by) REFERENCES members(workspace_id, id) ON DELETE SET NULL			
)
WITH (
	OIDS=FALSE
) ;
