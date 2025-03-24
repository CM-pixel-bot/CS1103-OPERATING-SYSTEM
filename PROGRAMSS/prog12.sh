
LOG_FILE="signal_handling.log"
handle_sigint() {
echo "SIGINT (Ctrl+C) received! Cleaning up..."
echo "$(date): SIGINT received, exiting gracefully." >> "$LOG_FILE"
exit 0
}
handle_sigterm() {
echo "SIGTERM signal received! Terminating..."
echo "$(date): SIGTERM received, exiting gracefully." >> "$LOG_FILE"
exit 0
}
handle_sighup() {
echo "SIGHUP signal received! Reloading configuration..."
echo "$(date): SIGHUP received, reloading configuration." >> "$LOG_FILE"
}
trap 'handle_sigint' SIGINT
trap 'handle_sigterm' SIGTERM
trap 'handle_sighup' SIGHUP
echo "Running... Press Ctrl+C to trigger SIGINT, or send SIGTERM (kill) to
terminate."
while true; do
echo "Working... (Press Ctrl+C to stop, or send SIGTERM to terminate)"
sleep 2
done
