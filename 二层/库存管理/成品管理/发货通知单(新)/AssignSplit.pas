unit AssignSplit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids;

type
  TForm_AssignSplit = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Button2: TButton;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_AssignSplit: TForm_AssignSplit;

implementation

uses Demo, PackList;

{$R *.dfm}

procedure TForm_AssignSplit.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm_AssignSplit.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm_AssignSplit.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit4.Text)='' then edit4.Text:='0';
if strtoint(edit4.Text)>=strtoint(Edit3.Text) then
 edit4.Text:='0';
end;

procedure TForm_AssignSplit.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit2.Text)='' then edit2.Text:='0';
if strtoint(edit2.Text)>strtoint(Edit1.Text) then
 edit2.Text:='0';
end;

procedure TForm_AssignSplit.Button1Click(Sender: TObject);
var
weight:Extended;
begin
 if StrToInt(Edit3.Text)=0 then
 begin
   MessageDlg('拆分后数量不能为0!',mtInformation,[mbOK],1);
   Exit;
 end;
 if messagedlg('装运指派的数量拆分将是不可逆操作,您确定吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
   try
   DM.ADOConnection1.BeginTrans;
   weight:=0;
   with dm.ADOQuery1 do //修改64表相关数量和价格信息
   begin
    close;
    sql.Clear;
    sql.Add('select * from data0064');
    sql.Add('where rkey='+Form_PackList.StringGrid2.Cells[0,Form_PackList.StringGrid1.Row]);
    open;
    weight:=FieldValues['REPORT_UNIT_VALUE1']*strtoint(edit4.Text)*0.001+strtoint(edit2.Text)*0.5;
    edit;
    fieldvalues['QUAN_SHIPPED']:=strtoint(edit4.Text);
    FieldValues['cartons_no']:=StrToInt(Edit2.Text);
    post;
   end;
   if Form_PackList.ade_flag=2 then //编辑时修改关联530的箱数和毛重
   begin
     with DM.ADOQuery2 do
     begin
       Close;
       SQL.Clear;
       SQL.Add('select cartons_no,weight from data0530');
       SQL.Add('where rkey64_ptr='+Form_PackList.StringGrid2.Cells[0,Form_PackList.StringGrid1.Row]);
       Open;
       Edit;
       FieldValues['cartons_no']:=strtoint(edit2.Text);
       FieldValues['weight']:=weight;
       Post;
     end;
   end;
   with dm.ADOQuery3 do//把拆分出去的数量重新生成一个指派
   begin
    close;
    sql.Clear;
    sql.Add('select * from data0064 where rkey is null');
    open;
    append;
    fieldvalues['SO_PTR']:=dm.ADOQuery1.FieldValues['SO_PTR'];
    fieldvalues['ENT_EMPL_PTR']:=dm.ADOQuery1.FieldValues['ENT_EMPL_PTR'];
    fieldvalues['ENT_CSI_USER_PTR']:= dm.ADOQuery1.FieldValues['ENT_CSI_USER_PTR'];
    fieldvalues['DATE_ASSIGN']:= dm.ADOQuery1.FieldValues['DATE_ASSIGN'];
    fieldvalues['SHIPMENT_NO']:= dm.ADOQuery1.FieldValues['SHIPMENT_NO'];
    fieldvalues['QUAN_SHIPPED']:=StrToInt(edit3.Text)-StrToInt(Edit4.Text);
    fieldvalues['part_price']:=dm.ADOQuery1.FieldValues['part_price'];
    fieldvalues['rush_charge']:=dm.ADOQuery1.FieldValues['rush_charge'];
    fieldvalues['prod_tax_flag']:=dm.ADOQuery1.FieldValues['prod_tax_flag'];
    fieldvalues['tool_tax_flag']:=dm.ADOQuery1.FieldValues['tool_tax_flag'];
    fieldvalues['discount']:=dm.ADOQuery1.FieldValues['discount'];
    fieldvalues['TAX_2']:=dm.ADOQuery1.FieldValues['TAX_2'];
    fieldvalues['assign_type']:=dm.ADOQuery1.FieldValues['assign_type'];
    fieldvalues['REPORT_UNIT_VALUE1']:=dm.ADOQuery1.FieldValues['REPORT_UNIT_VALUE1'];
    FieldValues['CARTONS_NO']:=strtoint(edit1.Text)-StrToInt(Edit2.Text);
    fieldvalues['packing_list_ptr']:=dm.ADOQuery1.FieldValues['packing_list_ptr'];
    fieldvalues['PACKING_SLIP_FLAG']:=dm.ADOQuery1.FieldValues['PACKING_SLIP_FLAG'];
    post;
   end;
   dm.ADOConnection1.CommitTrans;
   Form_PackList.StringGrid1.Cells[7,Form_PackList.StringGrid1.Row]:=Edit4.Text;
   Form_PackList.StringGrid1.Cells[9,Form_PackList.StringGrid1.Row]:=Edit2.Text;
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     screen.Cursor:=crdefault;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
 end;
end;

end.
