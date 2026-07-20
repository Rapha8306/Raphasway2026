# Vorgeschlagenes Datenmodell

## User
id, displayName, email, locale, role, createdAt

## Family
id, name, ownerId, createdAt

## FamilyMember
id, familyId, userId, displayName, role, birthDate, avatarUrl

## Task
id, familyId, title, description, assigneeId, dueAt, priority, completed, createdAt, updatedAt

## Event
id, familyId, title, description, startsAt, endsAt, location, recurrenceRule

## Document
id, familyId, title, category, storagePath, encrypted, createdAt

IDs sollen UUIDs sein. Zeitstempel werden intern in UTC gespeichert und lokal dargestellt.
