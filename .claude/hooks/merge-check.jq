.tool_input as $i |
if ($i.merge_method // "") != "squash" then
  {hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"deny",permissionDecisionReason:("merge_method must be \"squash\" (project CLAUDE.md). Got: " + ($i.merge_method // "<unset>"))}}
elif (($i.commit_title // "") | length) == 0 then
  {hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"deny",permissionDecisionReason:"commit_title is required — never fall back to the GitHub default (project CLAUDE.md). Format: <type>(<scope>): <description> (#<pr>)."}}
elif (($i.commit_message // "") | length) == 0 then
  {hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"deny",permissionDecisionReason:"commit_message is required — never fall back to the GitHub default (project CLAUDE.md). Body should be a short summary that stands on its own, the way the PR description does."}}
else
  {hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"allow"}}
end
