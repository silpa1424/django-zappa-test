FROM amazon/aws-lambda-python:3.8

ARG FUNCTION_DIR="/var/task/"

COPY ./requirements.txt /var/task/requirements.txt
# Setup Python environment
RUN pip install -r requirements.txt
# RUN POETRY_VIRTUALENVS_CREATE=false poetry install --no-root

# Grab the zappa handler.py and put it in the working directory
RUN ZAPPA_HANDLER_PATH=$( \
    python -c "from zappa import handler; print (handler.__file__)" \
    ) \
    && echo $ZAPPA_HANDLER_PATH \
    && cp $ZAPPA_HANDLER_PATH ${FUNCTION_DIR}

RUN yum -y install subversion
COPY .subversion/ /home/sbx_user1051/.subversion/

COPY ./ ${FUNCTION_DIR}

CMD [ "handler.lambda_handler" ]
