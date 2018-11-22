unit UEP121;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DB, ADODB,common, Menus;

type
  TMain_Form = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StringGrid1: TStringGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1CATEGORY: TStringField;
    ADOQuery1SHARE_scale: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
  private
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;
  v_edit:boolean;
implementation

uses UDetail;



{$R *.dfm}

procedure TMain_Form.FormCreate(Sender: TObject);
begin
if not App_Init(ADOConnection1) then
  begin
    ShowMsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  // vprev := '1';
  //user_ptr := '3';
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TMain_Form.FormActivate(Sender: TObject);
var
i : integer;
begin
if not adoquery1.Active then adoquery1.Active:=true;
//if not adoquery2.Active then adoquery2.Active:=true;
 stringgrid1.Cells[0,0]:='编号';
 stringgrid1.Cells[1,0]:='扣款类别';
 stringgrid1.Cells[2,0]:='分担比例%';
 for i:=1 to 20 do
  stringgrid1.Cells[0,i]:=inttostr(i);
 if not adoquery1.IsEmpty  then
 begin
    for i:=1 to adoquery1.RecordCount do
    begin
        stringgrid1.Cells[1,i]:=adoquery1.FieldValues['CATEGORY'];
        stringgrid1.Cells[2,i]:=adoquery1.FieldValues['SHARE_scale'];
        adoquery1.Next;
    end;
   end;
  adoquery1.First;
end;

procedure TMain_Form.BitBtn1Click(Sender: TObject);
var
 v_message:integer;
 bEof: boolean;
begin
if v_edit then
 begin
 v_message:=messagedlg('数据已修改,是否存盘?',mtConfirmation,[mbyes,mbno,mbcancel],0);
  if v_message=7 then
   begin
    bEof := false;
     while adoquery1.UpdateStatus = usInserted do
     begin
      if adoquery1.Eof then bEof := true;
         if (not adoquery1.Eof) and (not bEof) then
              adoquery1.Next
         else
              adoquery1.Prior;
     end;
     adoquery1.cancelBatch();
     Application.Terminate;
    {adoquery1.CancelBatch();
    Application.Terminate;    //取消对所有记录的修改包括新增 }
   end
  else
   if v_message=6 then    //对修改的记录存盘
    begin
      bitbtn2click(sender);
      Application.Terminate;
    end
    else                    //cancel不存盘也不保存
      exit;
 end
else
 Application.Terminate;
end;


procedure TMain_Form.BitBtn2Click(Sender: TObject);
begin
if (vprev = '1') or (vprev = '3') then
 begin
    showmsg('你只有查看权限，不能做其他操作',1);
 end
 else
 begin
    adoquery1.UpdateBatch();
    bitbtn2.Enabled := false;
    v_edit:=false;
    application.Terminate;
 end;
end;


procedure TMain_Form.N1Click(Sender: TObject);
var
 i:byte;
begin
if (vprev = '1') or (vprev = '3') then
 begin
    showmsg('你只有查看权限，不能做其他操作',1);
 end
 else
 begin
  adoquery1.Append;
  if Detail_Form.ShowModal=mrok then
    begin
      for i:=1 to 20 do //比较是否有重复类型名称
    begin
     if stringgrid1.Cells[1,i]='' then break;
     if comparetext(TRIM(stringgrid1.Cells[1,i]),TRIM(adoquery1.FieldValues['category']))=0 then
      begin
       messagedlg('类别名重复,请重新输入!',mtwarning,[mbok],0);
       adoquery1.Cancel;
       exit;
      end;
    end;
    adoquery1.Post;
    v_edit:=true;
    bitbtn2.Enabled := true;
    stringgrid1.Cells[1,adoquery1.RecordCount]:=adoquery1.FieldValues['category'];
    stringgrid1.Cells[2,adoquery1.RecordCount]:= formatfloat('0.00',adoquery1.FieldValues['SHARE_scale']);
  end;
 end;
end;

procedure TMain_Form.N2Click(Sender: TObject);
var
 searchoption:tlocateoptions;
 i:byte;
begin
if (vprev = '1') or (vprev = '3') then
 begin
    showmsg('你只有查看权限，不能做其他操作',1);
 end
 else
 begin
    searchoption:=[lopartialkey];
    Adoquery1.Locate('category',stringgrid1.Cells[1,stringgrid1.Row],searchoption);
    Detail_Form.Edit1.Text:=adoquery1.FieldValues['category'];
    Detail_Form.Edit2.Text:=adoquery1.FieldValues['SHARE_scale'];
    Detail_Form.edit1.Font.Color:=clwindowtext;
    adoquery1.Edit;
    if Detail_Form.ShowModal=mrok then
      begin
          for i:=1 to 20 do //比较是否有重复类型名称
          begin
              if stringgrid1.Cells[1,i]='' then break;
                if i<>stringgrid1.Row then
                    if comparetext(TRIM(stringgrid1.Cells[1,i]),TRIM(adoquery1.FieldValues['category']))=0 then
                    begin
                        messagedlg('类别名重复,请重新输入!',mtwarning,[mbok],0);
                        adoquery1.Cancel;
                        exit;
                    end;
          end;
            adoquery1.Post;
            v_edit:=true;
            bitbtn2.Enabled := true;
            stringgrid1.Cells[1,stringgrid1.Row]:=adoquery1.FieldValues['category'];
            stringgrid1.Cells[2,stringgrid1.Row]:=formatfloat('0.00',adoquery1.FieldValues['SHARE_scale']);
    end;
 end;
end;


procedure TMain_Form.N3Click(Sender: TObject);
var
 searchoption:tlocateoptions;
 i:byte;
begin
if (vprev = '1') or (vprev = '3') then
 begin
    showmsg('你只有查看权限，不能做其他操作',1);
 end
 else
 begin

 searchoption:=[lopartialkey];
 Adoquery1.Locate('category',stringgrid1.Cells[1,stringgrid1.Row],searchoption);
  for i:=stringgrid1.Row to adoquery1.RecordCount do
   begin
    if i<>adoquery1.RecordCount then
     begin
      stringgrid1.Cells[1,i]:=stringgrid1.Cells[1,i+1];
      stringgrid1.Cells[2,i]:=stringgrid1.Cells[2,i+1];
      end else
     begin
      stringgrid1.Cells[1,i]:='';
      stringgrid1.Cells[2,i]:='';
     end;
   end;
  adoquery1.Delete;
  v_edit := true;
  bitbtn2.Enabled := true;

  end;
end;

procedure TMain_Form.PopupMenu1Popup(Sender: TObject);
begin
if stringgrid1.Cells[1,stringgrid1.Row] = '' then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
 end else
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;
 end;
 if adoquery1.RecordCount>=20 then
  n1.Enabled:=false
 else
  n1.Enabled:=true;
end;

procedure TMain_Form.StringGrid1DblClick(Sender: TObject);
begin
if (vprev = '1') or (vprev = '3') then
 begin
    showmsg('你只有查看权限，不能做其他操作',1);
 end
 else
 begin
  if stringgrid1.Cells[1,stringgrid1.Row] <> '' then
    N2click(sender);
  end;
end;

procedure TMain_Form.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   column,row:longint;
begin
if button=mbright then
 begin
  stringgrid1.MouseToCell(x,y,column,row);
   if row<>0 then
  stringgrid1.Row:=row;
 end;
end;


procedure TMain_Form.FormShow(Sender: TObject);
begin
if Adoconnection1.Connected then
 begin

 end;
end;

initialization  //初始发变量
v_edit:=false;

end.
