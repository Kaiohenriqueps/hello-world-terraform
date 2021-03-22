from flask import escape
import logging

def hello_http(request):
    """HTTP Cloud Function.
    Args:
        request (flask.Request): The request object.
        <https://flask.palletsprojects.com/en/1.1.x/api/#incoming-request-data>
    Returns:
        The response text, or any set of values that can be turned into a
        Response object using `make_response`
        <https://flask.palletsprojects.com/en/1.1.x/api/#flask.make_response>.
    """
    request_json = request.get_json(silent=True)
    request_args = request.args
    logging.info(request_args)


    if request_json:
        name = request_json.get('name', 'NA')
    elif request_args:
        name = request_args.get('name', 'NA')
    else:
        name = 'World'
    return f"Hello, my name is {escape(name)}!"