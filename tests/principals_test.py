from core.models.assignments import AssignmentStateEnum, GradeEnum


def test_get_assignments(client, h_principal):
    response = client.get(
        '/principal/assignments',
        headers=h_principal
    )

    assert response.status_code == 200

    data = response.json['data']
    for assignment in data:
        assert assignment['state'] in [AssignmentStateEnum.SUBMITTED, AssignmentStateEnum.GRADED]


def test_grade_assignment_draft_assignment(client, h_principal):
    """
    failure case: If an assignment is in Draft state, it cannot be graded by principal
    """
    response = client.post(
        '/principal/assignments/grade',
        json={
            'id': 5,
            'grade': GradeEnum.A.value
        },
        headers=h_principal
    )

    assert response.status_code == 400


def test_grade_assignment(client, h_principal):
    response = client.post(
        '/principal/assignments/grade',
        json={
            'id': 4,
            'grade': GradeEnum.C.value
        },
        headers=h_principal
    )

    assert response.status_code == 200

    assert response.json['data']['state'] == AssignmentStateEnum.GRADED.value
    assert response.json['data']['grade'] == GradeEnum.C


def test_regrade_assignment(client, h_principal):
    response = client.post(
        '/principal/assignments/grade',
        json={
            'id': 4,
            'grade': GradeEnum.B.value
        },
        headers=h_principal
    )

    assert response.status_code == 200

    assert response.json['data']['state'] == AssignmentStateEnum.GRADED.value
    assert response.json['data']['grade'] == GradeEnum.B


# Test to list all teachers by principal
def test_list_teachers(client,h_principal):
    response = client.get(
        '/principal/teachers',
        headers=h_principal
    )
    assert response.status_code == 200

# Test to list teachers by principal with empty/invalid headers(auth errors)
def test_list_teachers_missing_headers(client,h_principal):
    response = client.get(
        '/principal/teachers',
        headers={
            # 'X-Principal': json.dumps({
            #     'principal_id': 1,
            #     'user_id': 5
            # })
        }
    )
    error_response = response.json
    assert response.status_code == 401
    assert error_response['error'] == 'FyleError'
    assert error_response["message"] == 'principal not found'

# Test to list teachers by principal through unknown API endpoint.
def test_list_teachers_unknown_route(client,h_principal):
    response = client.get(
        '/principal/unknown',
        headers=h_principal
    )
    error_response = response.json
    assert response.status_code == 404
    assert error_response['error'] == 'NotFound'
    assert error_response["message"] == '404 Not Found: The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.'