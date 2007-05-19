unit StringInspectorTests;

// The contents of this file are subject to the Mozilla Public License
// Version 1.1 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://www.mozilla.org/MPL/
//
// Software distributed under the License is distributed on an "AS IS"
// basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
// License for the specific language governing rights and limitations
// under the License.
//
// The Original Code is DUnitLite.
//
// The Initial Developer of the Original Code is Joe White.
// Portions created by Joe White are Copyright (C) 2007
// Joe White. All Rights Reserved.
//
// Contributor(s):
//
// Alternatively, the contents of this file may be used under the terms
// of the LGPL license (the  "LGPL License"), in which case the
// provisions of LGPL License are applicable instead of those
// above. If you wish to allow use of your version of this file only
// under the terms of the LGPL License and not to allow others to use
// your version of this file under the MPL, indicate your decision by
// deleting the provisions above and replace them with the notice and
// other provisions required by the LGPL License. If you do not delete
// the provisions above, a recipient may use your version of this file
// under either the MPL or the LGPL License.

interface

uses
  StringInspectors,
  RegisterableTestCases;

type
  TestStringInspector = class(TRegisterableTestCase)
  strict private
    FInspector: IStringInspector;
    function Apostrophes(Count: Integer): string;
  strict protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestEmptyString;
    procedure TestSingleNormalCharacter;
    procedure TestMultipleNormalCharacters;
    procedure TestSingleLowAsciiCharacter;
    procedure TestMultipleLowAsciiCharacters;
    procedure TestSingleApostrophe;
    procedure TestMultipleApostrophes;
    procedure TestNormalCharactersThenLowAscii;
    procedure TestLowAsciiThenNormalCharacters;
    procedure TestLowAsciiThenApostrophe;
  end;

implementation

{ TestStringInspector }

function TestStringInspector.Apostrophes(Count: Integer): string;
begin
  Result := StringOfChar(Apostrophe, Count);
end;

procedure TestStringInspector.SetUp;
begin
  inherited;
  FInspector := TStringInspector.Create;
end;

procedure TestStringInspector.TearDown;
begin
  FInspector := nil;
  inherited;
end;

procedure TestStringInspector.TestEmptyString;
begin
  CheckEquals(Apostrophes(2), FInspector.Execute(''));
end;

procedure TestStringInspector.TestLowAsciiThenApostrophe;
begin
  CheckEquals('#9' + Apostrophes(4), FInspector.Execute(#9 + Apostrophe));
end;

procedure TestStringInspector.TestLowAsciiThenNormalCharacters;
begin
  CheckEquals('#9' + Apostrophe + 'ab' + Apostrophe, FInspector.Execute(#9'ab'));
end;

procedure TestStringInspector.TestMultipleApostrophes;
begin
  CheckEquals(Apostrophes(6), FInspector.Execute(Apostrophes(2)));
end;

procedure TestStringInspector.TestMultipleLowAsciiCharacters;
begin
  CheckEquals('#13#10', FInspector.Execute(#13#10));
end;

procedure TestStringInspector.TestMultipleNormalCharacters;
begin
  CheckEquals(Apostrophe + 'ab' + Apostrophe, FInspector.Execute('ab'));
end;

procedure TestStringInspector.TestNormalCharactersThenLowAscii;
begin
  CheckEquals(Apostrophe + 'ab' + Apostrophe + '#13#10', FInspector.Execute('ab'#13#10));
end;

procedure TestStringInspector.TestSingleApostrophe;
begin
  CheckEquals(Apostrophes(4), FInspector.Execute(Apostrophe));
end;

procedure TestStringInspector.TestSingleLowAsciiCharacter;
begin
  CheckEquals('#0', FInspector.Execute(#0));
end;

procedure TestStringInspector.TestSingleNormalCharacter;
begin
  CheckEquals(Apostrophe + 'a' + Apostrophe, FInspector.Execute('a'));
end;

initialization
  TestStringInspector.Register;
end.