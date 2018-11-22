unit findUnit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, findUnit1, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGridEh;

type
  TfindForm4 = class(TfindForm1)
    ADOStoredProc1rkey: TIntegerField;
    ADOStoredProc1cut_date: TDateTimeField;
    ADOStoredProc1EMPLOYEE_NAME: TStringField;
    ADOStoredProc1CLOSED: TStringField;
    procedure Temp_DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
                                           Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Temp_DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  findForm4: TfindForm4;

implementation

{$R *.dfm}

procedure TfindForm4.Temp_DBGridEh1TitleBtnClick(Sender: TObject;
                                                 ACol: Integer; Column: TColumnEh);
begin   //此事件每次都要改动
  inherited;
  if not Temp_DBGridEh1.DataSource.DataSet.Active then exit;
  //如果只有一条记录不存在排序的问题
  if Temp_DBGridEh1.DataSource.DataSet.RecordCount <= 1 then exit;
  // self.TitleBtnSort1(sender,acol,column,adoquery,1)
  TitleBtnSort1(sender,acol,column,ADOStoredProc1);

  Label1.Caption :=self.vColumn1.Title.Caption;   
end;

procedure TfindForm4.Edit1Change(Sender: TObject);
begin   //此事件每次都要改动
  inherited;
  self.EditDataChange(sender,ADOStoredProc1,'cut_date');
end;
procedure TfindForm4.FormShow(Sender: TObject);
begin  //刚要显示时要显示的第一个字段显示的名字
  inherited;
  Label1.Caption := '' ;
end;
procedure TfindForm4.BitBtn1Click(Sender: TObject);
begin  //清除以前的内容
  inherited;
  edit1.Text :='';
end;



procedure TfindForm4.Temp_DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  Button1Click(sender);
end;

end.
