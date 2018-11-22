unit empChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, UDM, DBCtrls, DB, ADODB;

type
  TFrmEmpChange = class(TForm)
    DBGridEh1: TDBGridEh;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    DBText9: TDBText;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1employeeid: TIntegerField;
    ADOQuery1type: TIntegerField;
    ADOQuery1reason: TIntegerField;
    ADOQuery1alterdate: TDateTimeField;
    ADOQuery1orginal_employeecode: TWideStringField;
    ADOQuery1orginal_departmentid: TIntegerField;
    ADOQuery1orginal_position: TIntegerField;
    ADOQuery1orginal_employ_type: TIntegerField;
    ADOQuery1orginal_politics_face: TIntegerField;
    ADOQuery1orginal_education: TIntegerField;
    ADOQuery1orginal_marriage: TIntegerField;
    ADOQuery1orginal_rank: TIntegerField;
    ADOQuery1new_employeecode: TWideStringField;
    ADOQuery1new_departmentid: TIntegerField;
    ADOQuery1new_position: TIntegerField;
    ADOQuery1new_employ_type: TIntegerField;
    ADOQuery1new_politics_face: TIntegerField;
    ADOQuery1new_education: TIntegerField;
    ADOQuery1new_marriage: TIntegerField;
    ADOQuery1new_rank: TIntegerField;
    ADOQuery1oper_date: TDateTimeField;
    ADOQuery1active: TIntegerField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1chinesename: TWideStringField;
    ADOQuery1employeecode: TWideStringField;
    ADOQuery1ondutytime: TDateTimeField;
    ADOQuery1employ_type: TIntegerField;
    ADOQuery1sex: TIntegerField;
    ADOQuery1outdutytime: TDateTimeField;
    ADOQuery1rank: TWideStringField;
    ADOQuery1rreason: TWideStringField;
    ADOQuery1ttype: TWideStringField;
    ADOQuery1pposition: TWideStringField;
    ADOQuery1dictid: TIntegerField;
    ADOQuery1nposition: TWideStringField;
    ADOQuery1oposition: TWideStringField;
    ADOQuery1nhtype: TWideStringField;
    ADOQuery1ohtype: TWideStringField;
    ADOQuery1phtype: TWideStringField;
    ADOQuery1nrank: TWideStringField;
    ADOQuery1orank: TWideStringField;
    ADOQuery1departmentname: TWideStringField;
    ADOQuery1ndepartmentname: TWideStringField;
    ADOQuery1odepartmentname: TWideStringField;
    ADOQuery1sexy: TStringField;
    ADOQuery1remark: TWideStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmpChange: TFrmEmpChange;

implementation

{$R *.dfm}

procedure TFrmEmpChange.FormCreate(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := ADOQuery1.SQL.Text
    + ' and employeeid=' + IntToStr(DM.employee_msg.FieldValues['rkey']);
  ADOQuery1.Open;
end;

end.
