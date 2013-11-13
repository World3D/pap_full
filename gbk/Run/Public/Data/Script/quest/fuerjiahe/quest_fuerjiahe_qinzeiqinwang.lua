--��������

--MisDescBegin
x223008_g_ScriptId = 223008
x223008_g_MissionIdPre =299
x223008_g_MissionId = 300
x223008_g_MissionKind = 20
x223008_g_MissionLevel = 100
--x223008_g_ScriptIdNext = {ScriptId = 223007 ,LV = 1 }
x223008_g_Name	="�ζ�" 
x223008_g_DemandItem ={}
x223008_g_DemandKill ={{id=445,num=20}}

x223008_g_MissionName="��������"
x223008_g_MissionInfo="    �����úܺã�����ģ�ְҵ��������Ҫ�����Ǹ���Ĵ߻��������ⳡս�¾���Ľ�����������ǡ�\n \n    ����Ҫ��ȡһЩ����Ч�ļƻ��������Ѷȿ��ܻ����Ӻܶࡣ����ȥ���˵�Ӫ�أ��������ǵľ��٣�"  --��������
x223008_g_MissionTarget="    #G�ζ�#W���㷵��#G�ղ�Ӫ��#Wɱ��20��#R�ղ����#W��"		                                                                                               
x223008_g_MissionComplete="    ���ǵľ�����Щ�����ˣ������ɸ����˿ɳ�֮������ɹ�����ʿ��"					--�������npc˵���Ļ�
x223008_g_ContinueInfo="    û���˾��ٵ��ղ��˻�ɥʧ�˽�����������"
--������
x223008_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x223008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x223008_g_RadioItemBonus={}

--MisDescEnd
x223008_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x223008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x223008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x223008_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x223008_g_MissionId)
		if x223008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x223008_g_MissionName)
			AddText(sceneId,x223008_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x223008_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ���ղ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223008_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x223008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x223008_g_MissionName)
		     AddText(sceneId,x223008_g_MissionComplete)
		     AddMoneyBonus(sceneId, x223008_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x223008_g_ScriptId, x223008_g_MissionId)
                end

        elseif x223008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x223008_g_MissionName)
                AddText(sceneId,x223008_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x223008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x223008_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x223008_g_ScriptId, x223008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x223008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x223008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x223008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x223008_g_ScriptId, x223008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x223008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x223008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x223008_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==17) then
		if IsMissionHaveDone(sceneId, selfId, x223008_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x223008_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x223008_g_MissionId, x223008_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x223008_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x223008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x223008_g_MissionId)
	for i, item in pairs(x223008_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x223008_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223008_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x223008_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x223008_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x223008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x223008_g_MissionId)
		AddExp(sceneId, selfId, x223008_g_ExpBonus)
		AddMoney(sceneId, selfId, x223008_g_MoneyBonus)
		for i, item in pairs(x223008_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x223008_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x223008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x223008_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x223008_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x223008_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x223008_g_DemandKill[1].id then 
       		    if num < x223008_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���ղ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223008_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x223008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x223008_OnItemChanged(sceneId, selfId, itemdataId)

end

