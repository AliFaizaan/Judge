try {
    Start-Job -Name celery -ArgumentList "$pwd" -ScriptBlock {cd $args[0]; python -m celery -A judge.tasks worker -n celery@localhost -c 5 --loglevel=info}
    python run.py
}
finally {
    Stop-Job -Name celery
}