unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, DBGridEh, Menus, DB, ADODB;

type
  TMain_Form = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DBGridEh1: TDBGridEh;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
   {}
  end;

var
  Main_Form: TMain_Form;

implementation

uses UDM,common,USalDe,Uformula;

{$R *.dfm}

procedure TMain_Form.FormCreate(Sender: TObject);
begin
  if not App_Init_2(dm.ADOCon) then
  begin
    ShowMsg('程序起动失败,请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;

 { dm.ADOCon.Open;
  rkey73:= '96';
  user_ptr := '110';
  vprev := '4'; } 

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  DM.ADOsalaryaccount.Open;
end;

procedure TMain_Form.BitBtn3Click(Sender: TObject);
begin
   Application.Terminate;
end;



procedure TMain_Form.N1Click(Sender: TObject);
begin
 { if (Tmenuitem(Sender).Tag in [0,3]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end; }
    case Tmenuitem(Sender).Tag of
        0,1,3: with TSalDe_Form.Create(nil) do
        begin
            Ftag:=Tmenuitem(Sender).Tag;
            FRkey := rkey73;
            if showmodal=mrok then
            begin
                DM.ADOsalaryaccount.Close;
                DM.ADOsalaryaccount.Open;
                DM.ADOsalaryaccount.Locate('rkey',Frkeymsg,[]);
            end;
            Free;
        end;

      2: begin

          if MessageBox(Handle,'确定删除此记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
              DM.ADOCon.BeginTrans;
              try
                DM.tmp1.Close;
                DM.tmp1.SQL.Clear;
                DM.tmp1.SQL.Text:='delete from dbo.salaryaccount where rkey='+dm.ADOsalaryaccountrkey.AsString;
                      if DM.tmp1.ExecSQL=0 then
                      begin
                        DM.ADOCon.RollbackTrans;
                        showmessage('删除数据失败,数据状态已发生变化...');
                      end else
                        DM.ADOCon.CommitTrans;
             except
               DM.ADOCon.RollbackTrans;
               showmessage('删除数据失败...');
             end;
             DM.ADOsalaryaccount.Close;
             DM.ADOsalaryaccount.Open;
         end;
    end;
end;

procedure TMain_Form.BitBtn1Click(Sender: TObject);
begin
     Tmenuitem(Sender).Tag := 1;
     Self.N1Click(Sender);
end;

procedure TMain_Form.BitBtn2Click(Sender: TObject);
begin
      dm.F_Accountid := DM.ADOsalaryaccountrkey.AsInteger;
      with TFormula_Form.Create(nil) do
      begin
            FAccountid := DM.ADOsalaryaccountrkey.AsInteger;
            FRkey := rkey73;
            if showmodal=mrok then
            begin
            end;
            Free;
            DM.ADODesignSalaryItem.Close;
      end;
end;

end.
