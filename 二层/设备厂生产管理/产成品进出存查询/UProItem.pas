unit UProItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBGridEh;

type
  TItem_Form = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    DBGridEh1: TDBGridEh;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    PreColumn: TColumnEh;
    
    { Private declarations }
  public
  field_name:string;
  { Public declarations }
  end;

var
  Item_Form: TItem_Form;

implementation

uses udm,common;

{$R *.dfm}

procedure TItem_Form.Button1Click(Sender: TObject);
begin
  if dm.ADOQuery1.IsEmpty then
  ModalResult:=mrno
  else
  ModalResult   :=   mrOK;
end;

procedure TItem_Form.FormCreate(Sender: TObject);
begin
  dm.ADOQuery1.FILTER := '';
  field_name := DBGridEh1.Columns[0].FieldName;

  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
end;

procedure TItem_Form.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not DM.ADOQuery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TItem_Form.Edit1Change(Sender: TObject);
begin
case strtoint(label2.Caption) of
0:  begin

       if trim(edit1.Text)<>'' then
            dm.ADOQuery1.Filter:= field_name +' like ''%'+trim(edit1.Text)+'%'''
        else
            dm.ADOQuery1.Filter:='';
        {IF EDIT1.TEXT<>'' THEN
          DM.ADOQuery1.Filter := '产品组别编码 like '''+trim(edit1.text)+'%'''
        ELSE
          DM.ADOQuery1.FILTER := '';
        if DM.ADOQuery1.IsEmpty then
            button1.Enabled := false
        else
            button1.Enabled := true; }
    end;
6:  begin
        label1.Caption := '员工代码';
         if trim(edit1.Text)<>'' then
            dm.ADOQuery1.Filter:=field_name+' like ''%'+trim(edit1.Text)+'%'''
        else
            dm.ADOQuery1.Filter:='';
        {IF EDIT1.TEXT<>'' THEN
          DM.ADOQuery1.Filter := '员工代码 like '''+trim(edit1.text)+'%'''
        ELSE
          DM.ADOQuery1.FILTER := '';
        if DM.ADOQuery1.IsEmpty then
            button1.Enabled := false
        else
            button1.Enabled := true; }
    end;
7:  begin
        label1.Caption := '仓库代码';
        if trim(edit1.Text)<>'' then
            dm.ADOQuery1.Filter:=field_name+' like ''%'+trim(edit1.Text)+'%'''
        else
            dm.ADOQuery1.Filter:='';
       { IF EDIT1.TEXT<>'' THEN
          DM.ADOQuery1.Filter := '仓库代码 like '''+trim(edit1.text)+'%'''
        ELSE
          DM.ADOQuery1.FILTER := '';
        if DM.ADOQuery1.IsEmpty then
            button1.Enabled := false
        else
            button1.Enabled := true; }
    end;
8:  begin
        label1.Caption := '部门代码';
        if trim(edit1.Text)<>'' then
            dm.ADOQuery1.Filter:=field_name+' like ''%'+trim(edit1.Text)+'%'''
        else
            dm.ADOQuery1.Filter:='';

       { IF EDIT1.TEXT<>'' THEN
          DM.ADOQuery1.Filter := '部门代码 like '''+trim(edit1.text)+'%'''
        ELSE
          DM.ADOQuery1.FILTER := '';
        if DM.ADOQuery1.IsEmpty then
            button1.Enabled := false
        else
            button1.Enabled := true; }
    end;
9:  begin
        label1.Caption := '客户代码';
        if trim(edit1.Text)<>'' then
            dm.ADOQuery1.Filter:=field_name+' like ''%'+trim(edit1.Text)+'%'''
        else
            dm.ADOQuery1.Filter:='';
    end;
10:  begin
        label1.Caption := '工厂代码';
        if trim(edit1.Text)<>'' then
            dm.ADOQuery1.Filter:=field_name+' like ''%'+trim(edit1.Text)+'%'''
        else
            dm.ADOQuery1.Filter:='';
    end;
  end;
end;

procedure TItem_Form.FormShow(Sender: TObject);
begin
  case strtoint(label2.Caption) of
    0:
    begin
      label1.Caption := '产品组别编码';
      Item_Form.Caption := '产品类型查找';
    end;
    6:
    begin
       label1.Caption := '员工代码';
       Item_Form.Caption := '员工查找';
    end;
    7:
    begin
    label1.Caption := '仓库代码';
    Item_Form.Caption := '仓库查找';
    end;
    8:
    begin
    label1.Caption := '部门代码';
    Item_Form.Caption := '部门查找';
    end;
    9:
    begin
    label1.Caption := '客户代码';
    Item_Form.Caption := '客户查找';
    end;
  end;
  self.DBGridEh1TitleClick(PreColumn);
  field_name := DBGridEh1.Columns[0].FieldName;
  
end;

procedure TItem_Form.DBGridEh1TitleClick(Column: TColumnEh);
begin
if column.Title.SortMarker =smDownEh then
begin
   column.Title.SortMarker:=smUpEh;
   dm.ADOQuery1.Sort:=Column.FieldName;
end
else
begin
   column.Title.SortMarker:=smDownEh;
   dm.ADOQuery1.Sort:=Column.FieldName+' DESC';
end;
if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
 begin
    label1.Caption := column.Title.Caption;
    self.field_name:=column.FieldName;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
    edit1.SetFocus;
  end
end;

procedure TItem_Form.DBGridEh1DblClick(Sender: TObject);
begin
     Button1Click(Sender);
end;

end.
