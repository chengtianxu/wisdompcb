unit PasTypeAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,common,Pick_Item_Single,myclass,ConstVar, Buttons, ExtCtrls;

type
  TfrmTypeAdd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    btnCancel: TBitBtn;
    edtType: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cbbReport: TComboBox;
    btnSearch: TBitBtn;
    procedure btnSearchClick(Sender: TObject);
    procedure edtTypeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
      List:Tstringlist;
      keyList:Tstringlist;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTypeAdd: TfrmTypeAdd;

implementation

uses DAMO, PasSelect;

{$R *.dfm}

procedure TfrmTypeAdd.btnSearchClick(Sender: TObject);
begin
  if frmSelect=nil then frmSelect:=TfrmSelect.Create(Self);
  frmSelect.SelectType:=0;
  if frmSelect.ShowModal=mryes then
  begin
    edtType.Text:='';
    keyList:=TStringList.Create;
    with frmSelect.adoSelect do
    begin
      First;
      while not Eof do
      begin
        edtType.Text:=FieldByName('类型编码').asstring + ','+ edtType.Text ;
        keyList.Add(FieldByName('类型名').asstring + '=' + FieldByName('rkey').AsString);
        Next;
      end;
    end;
    edtType.Text:=Copy(edtType.Text,0,Length(edtType.Text)-1);
    edtType.Tag:=StrToInt(keyList.Values[keyList.Names[0]]);
  end;
end;

procedure TfrmTypeAdd.edtTypeExit(Sender: TObject);
//var
//  sqlstr:string;
begin
//  if trim(edtType.Text)<>'' then
//  begin
//    with dm.adotmp do
//    begin
//      close;
//      sql.Clear;
//      sql.Text:='select rkey from data0496 where group_name='+ quotedstr(uppercase(trim(edtType.Text)));
//      open;
//      if not isempty then
//      begin
//        edtType.Tag:=FieldByName('rkey').asinteger;
//      end
//      else
//      begin
//        showmessage('材料类型不存在，请重新输入');
//        edtType.SetFocus;
//        exit;
//      end;
//    end;
//  end;
end;

procedure TfrmTypeAdd.FormCreate(Sender: TObject);
begin
//  MyDataClass:=TMyDataClass.Create(dm.ADOConnection1);
end;

procedure TfrmTypeAdd.BitBtn1Click(Sender: TObject);
var
  i:Integer;
begin
  if trim(edtType.Text)='' then
  begin
    showmessage('材料类型不能为空');
    edtType.SetFocus;
    exit;
  end;
  if cbbReport.Text='' then
  begin
    showmessage('报表名不能为空');
    cbbReport.SetFocus;
    exit;
  end;
//  for i:=0 to keyList.Count-1 do
//  begin
//    with dm.adotmp do
//    begin
//      close;
//      sql.clear;
//      sql.text:='select rkey496 from data0395 where rkey496='+ keyList.Values[keyList.Names[i]];
//      open;
//      if not isempty then
//      begin
//        showmessage('材料类型编码'+ keyList.Names[i] +'已经绑定了报表，不能重复绑定');
//        edtType.setfocus;
//        exit;
//      end;
//    end;
//  end;
  try
    with dm.adoTmp do
    begin
      close;
      sql.Clear;
      for i:=0 to keyList.Count-1 do
      begin
        sql.text:='insert into data0395 values('+ keyList.Values[keyList.Names[i]] + ','+
                    quotedstr(List.values[cbbReport.text])+','+
                    quotedstr(List.Names[cbbReport.ItemIndex])+')' + #13 + SQL.Text;
      end;
//      ShowMessage(SQL.Text);
      execsql;
    end;
    modalresult:=mryes;
  except
    on E: Exception do
    begin
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;

end;

procedure TfrmTypeAdd.FormShow(Sender: TObject);
var
  i:integer;
begin
  cbbReport.style:=csDropDown;
  List:=TStringList.Create;
//  List.add('来料通知单=IQCCHECKREPORT_NOMAL.rtm');
  List.add('铜板来料检验报表=IQCCHECKREPORT.RTM');
  List.add('FPC来料检验报表=IQCCheckReport_Rb.rtm');
  List.add('钻咀锣刀检验报表=IQCCheckReport_Dock.rtm');
  List.add('来料检查测量报表=IQCCheckReport_TEST.rtm');
  List.add('高频板来料检验报表=IQCCHECKREPORT_HF.rtm');
  for  i:=0 to List.Count-1 do
    cbbReport.Items.Add(List.Names[i]);
  cbbReport.Style:=csDropDownList;
end;

procedure TfrmTypeAdd.FormDestroy(Sender: TObject);
begin
  List.Free;
  keyList.Free;
  frmSelect.Free;
  frmSelect:=nil;
end;

end.
