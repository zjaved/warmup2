#6 functional tests here (python)

import unittest
import os
import testLib
        
class TestAddUser(testLib.RestTestCase):
    def response(a, counter, count = 1, code = testLib.RestTestCase.SUCCESS):
        expected = { 'code' : code }
        if count is not None:
            expected['count']  = count
            
        a.assertDictEqual(expected, counter)
    def response2(a, counter, code = testLib.RestTestCase.SUCCESS):
        expected = { 'code' : code }
        a.assertDictEqual(expected, counter)
    def test1(a):
        counter = a.makeRequest("/users/add", method="POST", data = { 'user' : 'feed', 'password' : 'password'} )
        a.response(counter, count = 1)
    def test2(a):
        counter = a.makeRequest("/users/add", method="POST", data = { 'user' : 'feed', 'password' : ''} )
        a.response(counter, count = 1)
    def test3(a):
        counter = a.makeRequest("/users/add", method="POST", data = { 'user' : '', 'password' : 'password'} )
        a.retest4sponse2(counter, -3)
    def test4(a):
        a.makeRequest("/users/add", method="POST", data = { 'user' : 'feed', 'password' : 'password'} )
        counter = a.makeRequest("/users/add", method="POST", data = { 'user' : 'feed', 'password' : 'password'} )
        a.response2(counter, -2)
    def test5(a):
        counter = a.makeRequest("/users/add", method="POST", data = { 'user' : 'feedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeedfeed', 'password' : 'password'} )
        a.response2(counter, -3)

class TestLoginUser(testLib.RestTestCase):
    def response(a, counter, count = 1, code = testLib.RestTestCase.SUCCESS):
        expected = { 'code' : code }
        if count is not None:
            expected['count']  = count
        a.assertDictEqual(expected, counter)
    def testlog1(a):
        a.makeRequest("/users/add", method="POST", data = { 'user' : 'feed', 'password' : 'password'} )
        counter = a.makeRequest("/users/login", method="POST", data = { 'user' : 'feed', 'password' : 'password'} )
        a.response(counter, count = 2)
    def logfindtest(a):
        counter = a.makeRequest("/users/login", method="POST", data = { 'user' : 'feed', 'password' : 'password'} )
        a.response2(counter, code=-1)




