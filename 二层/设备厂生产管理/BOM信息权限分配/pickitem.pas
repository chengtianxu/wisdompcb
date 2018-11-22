unit pickitem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls,DBclient,DB, ExtCtrls;

type
  Tfrm_pickitem = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Panel2: TPanel;
    Button2: TButton;
    Button1: TButton;
    Eh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Eh1TitleClick(Column: TColumnEh);
    procedure Eh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
      precolumn1:TColumnEh;
  public
    { Public declarations }
  end;

var
  frm_pickitem: Tfrm_pickitem;

implementation

uses damo,MyClass;

{$R *.dfm}
 //显示
procedure Tfrm_pickitem.FormShow(Sender: TObject);
begin
     precolumn1 := Eh1.Columns[1];
end;
//全选
procedure Tfrm_pickitem.CheckBox1Click(Sender: TObject);
begin
     MyDataClass.UpdateValueToField(dm.CDS_pickitem,CheckBox1.Checked,'isselected');
end;
//标头
procedure Tfrm_pickitem.Eh1TitleClick(Column: TColumnEh);
begin
    if dm.CDS_pickitem.IndexName<>'' then
      begin
        dm.CDS_pickitem.DeleteIndex('px');
        dm.CDS_pickitem.IndexName:='';
      end;

      if column.Title.SortMarker=smupeh then
      begin
        column.Title.SortMarker:=smdowneh;
        dm.CDS_pickitem.AddIndex('px',column.FieldName,[ixDescending]);
        dm.CDS_pickitem.IndexName:='px';
      end
      else begin
        column.Title.SortMarker:=smupeh;
        dm.CDS_pickitem.AddIndex('px',column.FieldName,[ixPrimary]);
        dm.CDS_pickitem.IndexName:='px';
      end;

      if (column.ReadOnly) and (precolumn1.FieldName<>column.FieldName) then
      begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
        label1.Caption:='搜索('+column.Title.Caption+')：';
        precolumn1.Title.Color:=clbtnface;
        column.Title.Color:=clred;
        precolumn1:=column;
        Edit1.Text:='';
      end;
      edit1.SetFocus;
end;

procedure Tfrm_pickitem.Eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (chr(key)='V') and (ssalt in shift) then
       showmessage(dm.ADS_pickitem.CommandText);
end;

procedure Tfrm_pickitem.Edit1Change(Sender: TObject);
begin
     if precolumn1.ReadOnly = True then
       with dm.CDS_pickitem do
         begin
           Filtered := False;
           Filter := precolumn1.FieldName+ ' like '+'''%'+uppercase(trim(Edit1.Text))+'%''';
           Filtered := True;
         end;

end;

procedure Tfrm_pickitem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if dm.CDS_pickitem.IndexName<>'' then
      begin
        dm.CDS_pickitem.DeleteIndex('px');
        dm.CDS_pickitem.IndexName:='';
      end;
      dm.CDS_pickitem.Filter:='';
      dm.CDS_pickitem.Filtered:=false;

end;

end.
