unit USalDe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,ADODB,DB, ComCtrls;

type
  TSalDe_Form = class(TForm)
    Label2: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    DateTimePicker1: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    FRkey : string;
    Ftag : Integer;
    { Public declarations }
  end;

var
  SalDe_Form: TSalDe_Form;

implementation

uses UDM;

{$R *.dfm}

procedure TSalDe_Form.FormShow(Sender: TObject);
var
    QueryTmp:TADOQuery;
begin
     QueryTmp:=TADOQuery.Create(Self);
     QueryTmp.Connection := DM.ADOCon;
     if Ftag=0 then
     begin
           self.Caption:='帐套信息-新增';
           self.Edit2.Text :='';
           self.Edit3.Text :='';
           self.Edit5.Text :='';
           DateTimePicker1.Enabled := True;
           with QueryTmp do
           begin
                    close;
                    SQL.Clear;
                    sql.Text:='select getdate() as sys_date';
                    open;
                    DateTimePicker1.DateTime := FieldByName('sys_date').AsDateTime;
           end;
           with QueryTmp do
           begin
                      close;
                      sql.Text:='SELECT  USER_FULL_NAME '+
                                '  FROM         dbo.Data0073  '+
                                '  where rkey =  '+frkey+#13+#13;
                      open;
                      Edit5.Text :=  FieldByName('USER_FULL_NAME').AsString;
           end;
     end else
     begin
          if  Ftag in [1,3] then
          begin
                  if Ftag = 1 then
                  begin
                      self.Caption:='帐套信息-修改';
                      BitBtn2.Enabled := True;
                  end else begin
                      self.Caption:='帐套信息-查看';
                      BitBtn2.Enabled := False;
                  end;
                  DateTimePicker1.Enabled := False;
                  Edit2.Text := DM.ADOsalaryaccount.FieldByName('Accountname').AsString;
                  with QueryTmp do
                  begin
                      close;
                      sql.Text:='SELECT  USER_FULL_NAME '+
                                '  FROM         dbo.Data0073  '+
                                '  where EMPLOYEE_PTR =  '+DM.ADOsalaryaccount.FieldByName('createman').AsString;
                      open;
                      Edit5.Text :=  FieldByName('USER_FULL_NAME').AsString;
                  end;
                  DateTimePicker1.DateTime := DM.ADOsalaryaccount.FieldByName('createdate').AsDateTime;
                  Memo1.Text := DM.ADOsalaryaccount.FieldByName('discription').AsString;
                  with QueryTmp do
                  begin
                        close;
                        SQL.Clear;
                        sql.Text:='  SELECT  COUNT(rkey) AS wagetypecount '+
                                  '  FROM  dbo.employeemsg  '+
                                  '  WHERE  wagetype = '+DM.ADOsalaryaccount.FieldByName('rkey').AsString;;
                        open;
                        Edit3.Text := FieldByName('wagetypecount').asstring;
                  end;
          end;
     end;
end;

procedure TSalDe_Form.BitBtn2Click(Sender: TObject);
var
    QueryTmp:TADOQuery;
    stringtmp1,stringtmp2 : string;
begin
      if Trim(Edit2.Text) = '' then
      begin
          ShowMessage('帐套名称不能为空，请填写');
          Edit2.SetFocus;
          abort;
      end;
      stringtmp1 := '';
      QueryTmp:=TADOQuery.Create(Self);
      QueryTmp.Connection := DM.ADOCon;
      if  Ftag in [1,3] then
      begin
           with QueryTmp do
           begin
                      close;
                      sql.Text:=' SELECT  getdate() as sys_date, USER_FULL_NAME '+
                                '  FROM         dbo.Data0073  '+
                                '  where rkey =  '+frkey+#13+#13;
                      open;
                      stringtmp1 := '最后修改:'+ FieldByName('sys_date').AsString+' '+FieldByName('USER_FULL_NAME').AsString+' ';
           end;
      end;
      if DM.ADOCon.Connected then
      begin
               if Ftag=0 then DM.ADOsalaryaccount.Append else DM.ADOsalaryaccount.Edit;
               try
                            DM.ADOsalaryaccount.FieldByName('Accountname').Value :=  Trim(Edit2.Text);
                            DM.ADOsalaryaccount.FieldByName('discription').Value  := Memo1.Text;
                            DM.ADOsalaryaccount.FieldByName('createman').Value  := FRkey;
                            DM.ADOsalaryaccount.FieldByName('createdate').Value  := DateTimePicker1.DateTime;
                            DM.ADOsalaryaccount.FieldByName('remark').Value  := stringtmp1;
                            DM.ADOCon.BeginTrans;
                            DM.ADOsalaryaccount.Post;
                            DM.ADOsalaryaccount.UpdateBatch(arAll);
                            DM.ADOCon.CommitTrans;
                            Frkeymsg:=DM.ADOsalaryaccount.FieldByName('rkey').asinteger;
                            modalresult:=mrok;
               except
                            DM.ADOCon.RollbackTrans;
                            showmessage('保存数据失败...');
               end;
      end;

end;

end.
