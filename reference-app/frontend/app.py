from flask import Flask, render_template, request
import logging
from jaeger_client import Config
from opentracing.ext import tags
from opentracing.propagation import Format
import requests
from flask_opentracing import FlaskTracer

app = Flask(__name__)


def init_tracer(service):
    logging.getLogger('').handlers = []
    logging.basicConfig(format='%(message)s', level=logging.DEBUG)

    config = Config(
        config={
            'sampler': {
                'type': 'const',
                'param': 1,
            },
            'logging': True,
        },
        service_name=service,
    )

    # this call also sets opentracing.tracer
    return config.initialize_tracer()


# starter code
tracer = init_tracer('test-service')

# not entirely sure but I believe there's a flask_opentracing.init_tracing() missing here
# redis_opentracing.init_tracing(tracer, trace_all_classes=False)
flaskRacer = FlaskTracer(lambda: init_tracer(), True, app)

with tracer.start_span('first-span') as span:
    span.set_tag('first-tag', '100')


@app.route('/')
def homepage():
    return render_template("main.html")
    with tracer.start_span('TestSpan') as span:
        req = requests.get('https://udacity.com')
        span.set_tag('http.method;', req)
        def format():
            with tracer.start_span('my-test-span') as span:
                try:
                    print("success!")
                except:
                    print("try again")


if __name__ == "__main__":
    app.run()